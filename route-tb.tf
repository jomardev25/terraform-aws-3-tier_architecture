resource "aws_route_table" "public_web_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-web-rt"
  }
}

resource "aws_route_table_association" "public_web_rta" {
  subnet_id      = aws_subnet.public_web_subnet[count.index].id
  route_table_id = aws_route_table.public_web_rt.id
  count          = 2
}

resource "aws_route_table" "private_app_rt" {
  vpc_id = aws_vpc.main.id

  /* route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  } */

  tags = {
    Name = "private-app-rt"
  }
}

resource "aws_route_table_association" "private_app_rta" {
  subnet_id      = aws_subnet.private_app_subnet[count.index].id
  route_table_id = aws_route_table.private_app_rt.id
  count          = 2
}

resource "aws_route_table" "private_db_rt" {
  vpc_id = aws_vpc.main.id

  /* route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  } */

  tags = {
    Name = "private-db-rt"
  }
}

resource "aws_route_table_association" "private_db_rta" {
  subnet_id      = aws_subnet.private_db_subnet[count.index].id
  route_table_id = aws_route_table.private_db_rt.id
  count          = 2
}