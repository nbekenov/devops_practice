module "my_vpc" {
  source                = "../modules/create_vpc"
  vpc_name              = "my-vpc"
  cidr                  = "10.230.48.0/24"
  secondary_cidr_blocks = ["10.230.49.0/24"]
  public_subnets        = ["10.230.48.0/25", "10.230.48.128/25"]
  dhcp_domain_name      = var.dhcp_domain_name
  domain_name           = var.domain_name
}

###################
# DHCP Options Set
###################
resource "aws_vpc_dhcp_options" "sasdev_dhcp" {
  domain_name         = var.dhcp_domain_name
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = var.domain_name
  }

}
###############################
# DHCP Options Set Association
###############################
resource "aws_vpc_dhcp_options_association" "dhcp-association" {
  vpc_id          = module.my_vpc.vpc_id
  dhcp_options_id = aws_vpc_dhcp_options.sasdev_dhcp.id
}