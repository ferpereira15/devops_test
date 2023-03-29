resource "aws_vpc" "main_vpc" {
  cidr_block = "10.10.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "webserver-vpc"
  }
}

resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_internet_gateway"
  }
}

resource "aws_subnet" "public_subnet" {

  cidr_block = "10.10.0.0/24"
  vpc_id     = aws_vpc.main_vpc.id


  map_public_ip_on_launch = true
  availability_zone       =  "sa-east-1a"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.10.1.0/24"
  vpc_id     = aws_vpc.main_vpc.id

  map_public_ip_on_launch = true
  availability_zone       = "sa-east-1a"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_default_route_table" "public_route_table" {
  default_route_table_id = aws_vpc.main_vpc.main_route_table_id

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route" "public_igw" {
  route_table_id         = aws_default_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_internet_gateway.id

}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_default_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name = "eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "nat_gateway"
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}