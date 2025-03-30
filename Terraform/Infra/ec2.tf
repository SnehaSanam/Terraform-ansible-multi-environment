# Key Pair
resource "aws_key_pair" "ec2-key" {
  key_name   = "${var.env}-terra-ansible-multi-env"
  public_key = file("terra-ansible-multi-env.pub")
}

# VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-tws-app-sg"
  description = "This is security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0 
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

  tags = {
    Name        = "${var.env}-tws-app-sg"
    Environment = var.env
  }
}

# EC2 instances
resource "aws_instance" "my_instance" {
  count = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2-key.key_name
  security_groups = [aws_security_group.my_security_group.name]

  # Correct placement of tags at the resource level
  tags = {
    Name        = "${var.env}-Terra-ansible-multi-env"
    Environment = var.env
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  } 
}
