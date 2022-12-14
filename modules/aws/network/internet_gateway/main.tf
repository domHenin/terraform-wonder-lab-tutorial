# ---------------------------------------------------
# Create Internet Gateways for VPC
# ---------------------------------------------------

resource "aws_internet_gateway" "default" {
    vpc_id = var.vpc_id

    tags = {
        Name = var.name
    }  
}