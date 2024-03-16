resource "aws_internet_gateway" "igw-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id
  tags   = merge(var.mapping.dv.general_tags, { Name = "igw-${local.sufix}" })
}

# resource "aws_internet_gateway_attachment" "ig-attachment" {
#  internet_gateway_id = aws_internet_gateway.igw-terraform.id
#  vpc_id = aws_vpc.vpc-terraform.id

# }