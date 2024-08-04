terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

# creating ssh-key.
resource "aws_key_pair" "key_tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/vnktkey.pub")
}

output "keyname" {
  value = aws_key_pair.key_tf.key_name
}

resource "aws_instance" "web" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_tf.key_name
  #vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "docker-instance"
  }
}