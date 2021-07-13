provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_instance" "vm" {
  ami           = "ami-0c9fe0dec6325a30c"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.mysubnet.id
  tags = {
    Name = "my-first-tf-node"
  }
}


resource "aws_subnet" "mysubnet" {
  vpc_id     = "vpc-0458831a34479c811"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my-test-subnet"
  }
}
