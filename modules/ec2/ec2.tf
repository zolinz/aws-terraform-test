

resource "aws_instance" "vm" {
  ami           = "ami-0c9fe0dec6325a30c"
  instance_type = "t3.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.my_sec_group
  tags = {
    Name = var.vm_name
  }
}
