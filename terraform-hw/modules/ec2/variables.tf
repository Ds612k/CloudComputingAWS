variable "instance_type" {
 default = "t2.micro"
}

variable "key_name" {
 default = "MyKeyPair"
}

variable "ami" {
 default = "ami-0012607760f46be7b"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet to launch the EC2 instance in"
  type        = string
}
