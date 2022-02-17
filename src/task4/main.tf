terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 1.1.4"
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Configuration AWS provider
provider "aws" {
    profile = "default"
    region = var.aws_region
}

## CREATE A VIRTUAL PRIVATE CLOUD

resource "aws_vpc" "vpc_main" {
  cidr_block = var.main_vpc_cidr

  tags = {
    Name = var.tag_name
  }
}

## INTERNET GATEWAY AND NAT(ROUTE) INSIDE PUBLIC SUBNET

resource "aws_internet_gateway" "gateway_main" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = var.tag_name
  }
}

resource "aws_security_group" "allow_webserver" {
  name        = "allow_webserver"
  description = "Allow Default http inbound traffic"
  vpc_id      = aws_vpc.vpc_main.id

  ingress {
    description      = "Webserver from VPC"
    from_port        = 8085
    to_port          = 8085
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc_main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.vpc_main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.tag_name
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.gateway_main]
}

## PUBLIC SUBNET AND ROUTE TABLE##

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc_main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.tag_name
  }

  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

## PRIVATE SUBNET AND ROUTE TABLE##

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.vpc_main.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = var.tag_name
  }

  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = var.tag_name
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
