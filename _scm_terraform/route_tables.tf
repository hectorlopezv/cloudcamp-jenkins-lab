resource "aws_route_table" "rt-terraform-public" {
  vpc_id = aws_vpc.vpc-terraform.id
  tags   = merge(var.mapping.dv.general_tags, { Name = "rt-public-${local.sufix}" })
}

resource "aws_route" "route-terraform-public" {
  route_table_id         = aws_route_table.rt-terraform-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw-terraform.id

}

resource "aws_route_table_association" "rt-association-public" {
  for_each = var.mapping.dv.public_subnet_cidrs
  # count          = length(var.mapping.dv.public_subnet_cidrs)
  route_table_id = aws_route_table.rt-terraform-public.id
  subnet_id      = aws_subnet.public_subnets[each.key].id
}