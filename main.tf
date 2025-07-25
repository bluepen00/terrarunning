provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0d1b5a8c13042c939" # Ubuntu 24.04 LTS // us-east-2
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-test-instance"
  }
}
