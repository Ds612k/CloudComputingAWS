resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 enable_dns_support = var.enable_dns_support
 enable_dns_hostnames = var.enable_dns_hostnames
}

resource "aws_subnet" "public" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-2a"
 map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-2a"
  tags = {
    Name = "Private Subnet"
  }
}