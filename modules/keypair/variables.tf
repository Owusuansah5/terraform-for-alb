variable "key_algorithm" {
    description = "This is the key algorithm"
    default = "RSA"
  
}

variable "rsa_bits_size" {
    default = 2048
  
}

variable "the_key_name" {

  
}

variable "pem_filename" {
  
}


variable "pem_file_permission" {
    default = 400
  
}

variable "local_file" {
  
}

 variable "availability_zone" {
     type = string
 }

 variable "instance_type" {
     default = "t2.micro"
     type = string
 }

variable "ami" {
     type = string
     default = "ami-045269a1f5c90a6a0"
 }
# variable "vpc_security_group_ids" {
#     default = 
  
# }

variable "tags" {
    default = "webserver1"
  
}