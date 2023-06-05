terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

#Resource to Create Key Pair
resource "aws_key_pair" "demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

resource "aws_instance" "webserver" {
  ami                    = var.instance_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  key_name               = aws_key_pair.demo_key_pair.key_name

  user_data = file("${path.module}/apache_user_data.sh")

  tags = {
    Name = var.instance_name
  }
}