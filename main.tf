terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "=1.16.0"  
    }  
  }

  required_version = ">= 1.2.0"
}

variable "DB_USER" {
  type = string
  sensitive = true
}

variable "DB_PASSWORD" {
  type = string
  sensitive = true
}

provider "aws" {
  region = "us-east-1"
}

#create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create a RDS Database Instance
resource "aws_db_instance" "menuguru" {
  engine               = "mysql"
  identifier           = "menuguru"
  allocated_storage    =  20
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro"
  username             = "${var.DB_USER}"
  password             = "${var.DB_PASSWORD}"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
}

#create a RDS Customer Database Instance
resource "aws_db_instance" "menuguru-customer" {
  engine               = "mysql"
  identifier           = "menuguru-customer"
  allocated_storage    =  20
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro"
  username             = "${var.DB_USER}"
  password             = "${var.DB_PASSWORD}"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
}

#create a RDS Product Database Instance
resource "aws_db_instance" "menuguru-product" {
  engine               = "mysql"
  identifier           = "menuguru-product"
  allocated_storage    =  20
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro"
  username             = "${var.DB_USER}"
  password             = "${var.DB_PASSWORD}"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
}

#create a RDS Order Database Instance
resource "aws_db_instance" "menuguru-order" {
  engine               = "mysql"
  identifier           = "menuguru-order"
  allocated_storage    =  20
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro"
  username             = "${var.DB_USER}"
  password             = "${var.DB_PASSWORD}"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
}