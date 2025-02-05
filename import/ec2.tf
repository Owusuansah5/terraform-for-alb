# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "web" {
  ami                                  = "ami-0c614dee691cbbf37"
  availability_zone                    = "us-east-1a"
  instance_type                        = "t2.micro"
  key_name                             = "ec2-key"
  monitoring                           = false
  security_groups                      = ["launch-wizard-9"]
  subnet_id                            = "subnet-0a8291a9e8b7be1f0"
  tags = {
    Name = "terraform_import"
  }
  
  
  vpc_security_group_ids      = ["sg-0dbeade2b4ad51c33"]
}
  