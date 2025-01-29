#generate keypair
resource "tls_private_key" "tls" {
  algorithm = var.key_algorithm
  rsa_bits  = var.rsa_bits_size
}

resource "aws_key_pair" "key" {
  key_name   = var.the_key_name
  public_key = tls_private_key.tls.public_key_openssh
}

resource "local_file" "key1" {
  filename        = var.pem_filename
  content         = tls_private_key.tls.private_key_pem
  file_permission = var.pem_file_permission
}

resource "aws_instance" "server1" {
     availability_zone = var.availability_zone
     instance_type = var.instance_type
     ami = var.ami
     key_name = var.the_key_name
#     vpc_security_group_ids = [aws_security_group.ws.id]
#     user_data = file("code.sh")
#    subnet_id = aws_subnet.priv1.id
   tags = {
    Name = var.tags
   }
}