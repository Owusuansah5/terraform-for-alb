terraform {
    backend "s3" {
        bucket = "dev-terraform-state-bucket-619aa6df74d6ebec"
        key = "dev1/terraform.tfstate"
        dynamodb_table = "lock-table"
        region = "us-east-1"
        encrypt = true
      
    }
    
}
