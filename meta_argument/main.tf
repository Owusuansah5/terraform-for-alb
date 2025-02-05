/*
count = 2
depends_on
for_each
lifecycle
*/




##count and depend_on meta
/*
resource "aws_instance" "s1" {
    count = 1
    ami = "ami-0c614dee691cbbf37"
    instance_type = "t2.micro"

    tags = {
      Name = "devserver${count.index}"
    }
  
}

output "ip" {
    value = aws_instance.s1[*].public_ip
  
}

resource "aws_iam_user" "user1" {
    name = "Cloud_admin"
    depends_on = [ aws_instance.s1 ]
  
}
*/

## for_each
/*
variable "typeofinstance" {
    type = list(string)
    default = ["t2.micro", "t3.small"]
  
}

variable "info" {
    type = map(object({
        ami = string
        instance = string
    }))
    default = {  
    dev ={ami: "ami-045269a1f5c90a6a0", instance: "t2.micro"}
    qa = {ami: "ami-045269a1f5c90a6ahjghdfc", instance: "t2.micro"}
}
}
/*
resource "aws_instance" "s2" {
    for_each = toset(var.typeofinstance)
    ami = "ami-0c614dee691cbbf37"
    instance_type = each.key
  
}


resource "aws_instance" "s2" {
  for_each = var.info 
  ami = each.value.ami
  instance_type = each.value.instance
  tags = {
    Name = each.key
  }
}

*/


/*
provider "aws" {
    region = var.region

  
}

variable "region" {
    description = "value for region"
    type = string
   //default = "us-east-1"
  
}
*/
/*
provider "aws" {
    region = "us-east-1"
    alias = "us1"
  
}

provider "aws" {
    region = "us-west-1"
    alias = "usw1"
  
}


resource "aws_instance" "server1" {
    provider = aws.us1
  
}
*/

##lifecycle
provider "aws" {
    region = "us-east-1"
  
}


resource "aws_instance" "web1" {
    ##ami = "ami-04681163a08179f28"
    ami = "ami-0c614dee691cbbf37"
    instance_type = "t2.micro"
    lifecycle {
      //create_before_destroy = true
    }
  
}