# internet VPC
resource "aws_vpc" "sas_dev" {
  cidr_block                     = "10.230.48.0/24"
  instance_tenancy               = "default"
  enable_dns_support             = "true"
  enable_dns_hostnames           = "true"
  enable_classiclink             = "false"
  enable_classiclink_dns_support = "false"
  tags = {
    Name = "sas_dev"
  }
}

# add second CIDR
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.sas_dev.id
  cidr_block = "10.230.49.0/24"
}

# subnets
resource "aws_subnet" "sas-dev-publicsub-1" {
  vpc_id                  = aws_vpc.sas_dev.id
  cidr_block              = "10.230.48.0/25"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "sas_dev-public-us-east-1c"
  }
}
resource "aws_subnet" "sas-dev-publicsub-2" {
  vpc_id                  = aws_vpc.sas_dev.id
  cidr_block              = "10.230.48.128/25"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "sas_dev-public-us-east-1b"
  }
}

# internet GW
resource "aws_internet_gateway" "sas_dev-gw" {
  vpc_id = aws_vpc.sas_dev.id

  tags = {
    Name = "sas_dev_gw"
  }
}


# route tables
resource "aws_route_table" "sas_dev-rt" {
  vpc_id = aws_vpc.sas_dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sas_dev-gw.id
  }

  tags = {
    Name = "sas_dev-vpc-rt"
  }
}

# route subnet association
resource "aws_route_table_association" "sas-dev-public-1-a" {
  subnet_id      = aws_subnet.sas-dev-publicsub-1.id
  route_table_id = aws_route_table.sas_dev-rt.id
}

resource "aws_route_table_association" "sas-dev-public-2-a" {
  subnet_id      = aws_subnet.sas-dev-publicsub-2.id
  route_table_id = aws_route_table.sas_dev-rt.id
}