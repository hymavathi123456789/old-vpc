provider "aws" {
  region = var.region
}
resource "aws_vpc" "test" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "test"
  }
}

resource "aws_subnet" "subnet-1" {
  count = "${length(var.azs)}"
  vpc_id = aws_vpc.test.id
  cidr_block = "${element(var.subnet_cidr,count.index)}"

  tags = {
    Name = "subnet-${count.index+1}"
  }
}