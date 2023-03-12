terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_instance" "california_server" {
  ami           = "ami-060d3509162bcc386"
  instance_type = "t2.micro"
  key_name = "nameera"
  user_data = file("docker.sh")
  security_groups = ["default"]
  

  tags = {
  Name = "DockerTerraform"
  }
  }
  
resource "aws_security_group" "default" {
	tags = {
	type = "terraform-security-group"
}
}
