output "key_name" {
    value = aws_key_pair.key.key_name
  
}
output "pemkeyname" {
    value = local_file.key1.filename
  
}

output "ip-public" {
    value = aws_instance.server1.public_ip
  
}

# output "username"{
#     value = aws_instance.server1.username
  
# }

  output "ssh-command" {
    value = "ssh -i ${aws_key_pair.key.key_name}.pem ec2-user@${aws_instance.server1.public_ip}"
    
  }