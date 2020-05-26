###################
# VPC
###################
resource "aws_vpc" "this" {
  cidr_block                     = var.cidr
  instance_tenancy               = "default"
  enable_dns_support             = "true"
  enable_dns_hostnames           = "true"
  enable_classiclink             = "false"
  enable_classiclink_dns_support = "false"
  tags = {
    Name = var.vpc_name
  }
}
###################
# add second CIDR
###################
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  count      = length(var.secondary_cidr_blocks) > 0 ? length(var.secondary_cidr_blocks) : 0
  vpc_id     = aws_vpc.this.id
  cidr_block = element(var.secondary_cidr_blocks, count.index)
}

###################
# subnets
###################
resource "aws_subnet" "sas-dev-publicsub-1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnets[0]
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "sas-uat-public-us-east-1c"
  }
}
resource "aws_subnet" "sas-dev-publicsub-2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnets[1]
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "sas-uat-public-us-east-1b"
  }
}

###################
# internet gateway
###################
resource "aws_internet_gateway" "this-gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "sas_uat_gw"
  }
}

###################
# route tables
###################
resource "aws_route_table" "this-rt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this-gw.id
  }

  tags = {
    Name = "sas-uat-public-rt"
  }
}
###################
# route public subnets association
###################
resource "aws_route_table_association" "sas-dev-public-1-a" {
  subnet_id      = aws_subnet.sas-dev-publicsub-1.id
  route_table_id = aws_route_table.this-rt.id
}

resource "aws_route_table_association" "sas-dev-public-2-a" {
  subnet_id      = aws_subnet.sas-dev-publicsub-2.id
  route_table_id = aws_route_table.this-rt.id
}