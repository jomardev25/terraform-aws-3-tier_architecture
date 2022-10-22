resource "aws_subnet" "public_web_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_web_subnet_ips[count.index]
  availability_zone = var.az[count.index]
  count             = 2

  tags = {
    Name = "public-web-subnet"
  }
}

resource "aws_subnet" "private_app_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_app_subnet_ips[count.index]
  availability_zone = var.az[count.index]
  count             = 2

  tags = {
    Name = "private-app-subnet"
  }
}


resource "aws_subnet" "private_db_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet_ips[count.index]
  availability_zone = var.az[count.index]
  count             = 2

  tags = {
    Name = "private-db-subnet"
  }
}
