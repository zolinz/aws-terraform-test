
data "aws_vpc" "myvpc" {
  tags = {
    Name = "kk-tf-vpc"
  }
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = data.aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my-test-subnet"
  }
}



module "my-ec2" {
  source       = "./modules/ec2"
  vm_name      = "my-first-tf-node"
  subnet_id    = aws_subnet.mysubnet.id
  my_sec_group = [aws_security_group.my_ec2_sg.id]
}



resource "aws_security_group" "my_ec2_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.myvpc.id
  
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      description = "created by foreach"
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = [aws_subnet.mysubnet.cidr_block]
    }
  }
}


resource "aws_security_group" "my_lb_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.myvpc.id

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      description = "created by foreach"
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      security_groups = [aws_security_group.my_ec2_sg.id]
    }
  }
}
