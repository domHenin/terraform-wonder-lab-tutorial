#-----------------------------------------
# Creates a VPC Outputs
#-----------------------------------------

output "id" {
    value = aws_vpc.default.id  
}

output "vpc_main_route_table_id" {
    value = aws_vpc.default.main_route_table_id  
}