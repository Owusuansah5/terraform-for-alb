provider "aws" {
    region = "us-east-1"
  
}

import {
  to = aws_instance.web
  id = "i-0e990104481c4a40d"
}


/*resource "aws_instance" "web" {
  
}
*/