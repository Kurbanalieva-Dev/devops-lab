# main.tf

# 1. Указываем, где мы работаем
provider "aws" {
  region = "eu-north-1"
}

# 2. Создаем сеть (VPC), чтобы всё было изолировано
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "Bank-VPC" }
}

# 3. Создаем "умную" Security Group
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_traffic"
  vpc_id      = aws_vpc.main_vpc.id

  # Разрешаем SSH (для Ansible)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Разрешаем HTTP (для твоего сайта)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}