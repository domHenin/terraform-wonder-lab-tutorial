#-----------------------------------------
# Creates a VPC
#-----------------------------------------

resource "aws_vpc" "default" {
  cidr_block          = var.aws_vpc_block
  enable_dns_support  = true
  enable_dns_hostname = true

  tags = {
    "Name" = var.aws_vpc_tag_name
  }
}
