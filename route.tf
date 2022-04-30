############### public route tables ################### 

resource "aws_route_table" "public-rt1" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.eks-igw
  ]

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.eks-igw.id
    } 

  tags = {
    Name = "public-rt1"
  }
}

resource "aws_route_table" "public-rt2" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.eks-igw
  ]

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.eks-igw.id
    } 

  tags = {
    Name = "public-rt2"
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-rt1.id
}

resource "aws_route_table_association" "public-c" {
  subnet_id = aws_subnet.public-c.id
  route_table_id = aws_route_table.public-rt2.id
  
}

############### public route tables ###################

resource "aws_route_table" "private-rt1" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main,
    aws_nat_gateway.test-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-nat-gateway.id
  }

  tags = {
    Name = "private-rt1"
  }
  
}

resource "aws_route_table" "private-rt2" {
  vpc_id = aws_vpc.main.id
  
  depends_on = [
    aws_vpc.main,
    aws_nat_gateway.test-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-nat-gateway.id
  }

  tags = {
    Name = "private-rt2"
  }
  
}

resource "aws_route_table_association" "private-a" {
  route_table_id = aws_route_table.private-rt1.id
  subnet_id      = aws_subnet.private-a.id 
}

resource "aws_route_table_association" "private-cidr_block" {
  route_table_id = aws_route_table.private-rt2.id
  subnet_id      = aws_subnet.private-c.id 
}