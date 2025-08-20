provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "example" {
  ami           = "ami-0fb653ca2d3203ac1" # Ubuntu 24.04 LTS // us-east-2
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html 
              nohup busybox httpd -f -p 8080 &

              EOF

  user_data_replace_on_change = true


  tags = {
    Name = "terraform-test-instance"
  }
}
