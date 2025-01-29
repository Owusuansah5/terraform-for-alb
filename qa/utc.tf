provider "aws" {
    region = "us-east-1"
  
}

module "qa_key_pair" {
    source = "../modules/keypair"
    the_key_name = "qakeytest"
    pem_filename = "qakeytest.pem"
    
  
}