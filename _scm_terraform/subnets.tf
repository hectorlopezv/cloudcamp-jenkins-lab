resource "aws_subnet" "public_subnets" {
  for_each          = var.mapping.dv.public_subnet_cidrs
  vpc_id            = aws_vpc.vpc-terraform.id
  cidr_block        = each.value
  availability_zone = each.key
  # cidr_block              = element(var.mapping.dv.public_subnet_cidrs, count.index)
  # availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.mapping.dv.general_tags, { Name = "Public-Subnet-${each.key}-${local.sufix}" })
}
resource "aws_subnet" "private_subnets" {
  # count             = length(var.mapping.dv.private_subnet_cidrs)
  for_each          = var.mapping.dv.private_subnet_cidrs
  vpc_id            = aws_vpc.vpc-terraform.id
  cidr_block        = each.value
  availability_zone = each.key
  # cidr_block        = element(var.mapping.dv.private_subnet_cidrs, count.index)
  # availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  tags = merge(var.mapping.dv.general_tags, { Name = "Private-Subnet-${each.key}-${local.sufix}" })

}