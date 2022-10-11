#----------------------
# SUBNET for RDS
#----------------------
#----------------------
# PRO
#----------------------
module "aws_rds_sn_pub_pro_01" {
  source      = "./modules/aws/rds/subnet"
  name        = var.aws_rds_sn_pub_pro_01["name"]
  description = var.aws_rds_sn_pub_pro_01["description"]
}
