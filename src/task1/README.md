# sre-coding-challenge
Public Repo for Altais Coding Challenge

Goals: Information inside pdf below.

Pre-Requirements: 
    1. AWS Account
    2. IAM User with name terraform. Minimal privileges: 
        - AmazonEC2FullAccess
        - AmazonS3FullAccess
        - AmazonAPIGatewayAdministrator
        - AmazonVPCFullAccess
        - AmazonSNSFullAccess
    3- Configure locally access key and secret key to access aws with user terraform. 
        Default region: us-east-1
        In windows: Modify file credentials inside %USER%/.aws/credentials
    4- Install terraform v.1.1.5 in your folder user inside a bin folder. (Windows) Download here: https://www.terraform.io/downloads. And add to variable System PATH.
    5- Install go 1.17.7. Download here: https://go.dev/. We needed to execute test framework TerraTest.

How-To:
    Task 1-2. Execute:
        - "terraform plan" 
        - "terraform apply" (prompt and answer yes) 
    Task 3. Execute test
        - go /test/s3.go -v -timeout 30m

    