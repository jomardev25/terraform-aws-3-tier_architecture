/* resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.public_web_subnet[0].id

  tags = {
    Name = "private-app-subnet-natgw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "private_db_natgw" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.public_web_subnet[1].id

  tags = {
    Name = "private-db-subnet-natgw"
  }

  depends_on = [aws_internet_gateway.igw]
} */