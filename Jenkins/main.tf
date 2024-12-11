resource "aws_instance" "jenkinsServer" {
  ami = data.aws.ami.amazonlinux2023.id
  instance_type = var.my_instance_type
  key_name = var.my_key
  vpc_security_group_ids = [ aws_security_group.web-traffic.id ]

  tags = {
    "Name" = "Jenkins-Server"
  }
}