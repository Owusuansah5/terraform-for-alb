provider "aws" {
    region = "us-east-1"
  
}

module "key_pair" {
    source = "../modules/keypair"
    pem_filename = "devkeytest.pem"
    the_key_name = "devkeytest"
    availability_zone = "us-east-1a"
    local_file = "devkeytest.pem"

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  

  name = "dev-vpc-app1"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

output "key_name" {
    value = module.key_pair.key_name
  
}
output "pemkeyname" {
    value = module.key_pair.pemkeyname
  
}

module "aws_instance" {
    source = "../modules/keypair"
    ami = "ami-06ae0e97bcb59038c"
    instance_type = ""
    availability_zone = "us-east-1a"
    the_key_name = "devtestkey"
    pem_filename = "devtestkey.pem"
    local_file = "devtestkey.pem"
    
  
}

output "ip-public" {
    value = module.key_pair.ip-public
  
}

# output "username" {
#     value = module.key_pair.username
  
# }

output "ssh-command" {
    value = module.key_pair.ssh-command
  
}