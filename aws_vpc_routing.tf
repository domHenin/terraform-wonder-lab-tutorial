#-----------------------------------------
# MAIN Route Table (Default for all SUBNETS)
# Used for public zones / subnets
# It is the default route table if no other
# is specified
#-----------------------------------------

module "aws_main_route_table_public" {
  source = "./modules/aws/route/table"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_main_route_table_public // verifty: var.aws_main_route_table_public -> this set on guide   
}

#Add an Internet GW to the VPC routing main table

module "aws_internet_gateway" {
  source           = "./modules/aws/network/internet_gateway"
  route_table_id   = module.aws_main_route_table_public.id
  gateway_id       = module.aws_internet_gateway.id
  destination_cidr = var.aws_internet_route_module
  name             = var.aws_internet_route_name_module

}

# Set new main_route_table as main
resource "aws_route_table_association" "default" {
  vpc_id         = module.aws_network_vpc.id
  route_table_id = module.aws_main_route_table_public.vpc_id
}

#-----------------------------------------
# Private Route Table
# Used for private zone / subnet that have
# instances without a public IP address
# Each subnet should have its own route table
# as the NAT gateway lives in an availability
# zone
#-----------------------------------------

# For private networks in zone A
module "aws_private_zone_za" {
  source = "./modules/aws/network/route/table"
  vpc_id = "./module.aws_network_vpc.id"
  name   = var.var.aws_private_route_table_za_moduleF
}

#For private networks in zone B
module "aws_private_zone_zb" {
  source = "./modules/aws/network/route/table"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_private_route_table_zb_module
}
