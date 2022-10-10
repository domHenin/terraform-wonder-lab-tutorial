#-----------------------------------------
# Creates a VPC Variables
#-----------------------------------------

variable "aws_vpc_tag_name" {
    description = "name of the VPC"  
}

variable "aws_vpc_block" {
    description = "Private IP block for the VPC in CIDR format"  
}
