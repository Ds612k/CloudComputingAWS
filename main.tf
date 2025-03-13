provider "aws" {
  region = "us-east-2"  # Modify region if needed
}
resource "aws_instance" "my_ec2" {
  ami           = "ami-0012607760f46be7b"  # Replace with a valid AMI ID
  instance_type = "t2.micro"
  key_name      = "MyKeyPair"  # Replace with an existing AWS key pair
  tags = {
    Name = "ec2_instance_terraform"  # Modify instance name
  }
}
