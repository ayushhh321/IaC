resource "aws_instance" "bastion" {
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI ID
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name = "Bastion-Host"
  }
}
