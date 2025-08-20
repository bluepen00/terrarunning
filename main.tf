provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "example" {
  ami                    = "ami-0fb653ca2d3203ac1" # New Ubuntu Iyesnstance 
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World Tackie did this" > index.html 
              nohup busybox httpd -f -p 8080 &

              EOF

  user_data_replace_on_change = true


  tags = {
    Name = "terraform-test-instance"
  }
}

resource "aws_security_group" "instance-sg" {
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
