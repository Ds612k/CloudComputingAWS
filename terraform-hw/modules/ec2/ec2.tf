resource "aws_instance" "web_server" {
 ami = var.ami
 instance_type = var.instance_type
 subnet_id = var.private_subnet_id
 key_name = var.key_name
 vpc_security_group_ids = [aws_security_group.web_server_sg.id]

tags = {
    Name = "Web Server"
  }
}