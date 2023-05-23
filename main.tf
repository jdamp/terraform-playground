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
  ami                    = "ami-04e601abe3e1a910f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  key_name               = aws_key_pair.demo_key_pair.key_name

  tags = {
    Name = var.instance_name
  }
}