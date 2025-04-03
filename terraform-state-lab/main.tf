terraform {
  backend "s3" {
    bucket         = "terraform-state-yk68930"
    key            = "terraform/state.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
resource "aws_instance" "example" {
  ami           = "ami-0012607760f46be7b"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-Test-Instance"
  }
}

