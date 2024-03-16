resource "aws_vpc" "vpc-terraform" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  provider             = aws.us-east-1
  tags                 = merge(var.mapping.dv.general_tags, { Name = "${local.sufix}-vpc" })

}

# output "salida" {
#   value = data.aws_availability_zones.azs
# }