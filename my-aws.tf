provider "aws" {
  region = "ap-southeast-2"
}


data "aws_vpc" "myvpc" {
  tags = {
    Name = "kk-tf-vpc"
  }
}


module my-ec2{
  source = "./modules/ec2"
  vm_name =   "my-first-tf-node"
  subnet_id  = aws_subnet.mysubnet.id
  my_sec_group = [aws_security_group.my-ec2-sec-group.id]
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = data.aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my-test-subnet"
  }
}
