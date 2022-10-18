resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  subnet_id         = "aws_subnet.subnet-1[count.index]"

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "nat_rt" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "example"
  }
}