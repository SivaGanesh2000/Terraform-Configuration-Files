resource "aws_route_table" "rt" {
  vpc_id   = aws_vpc.vpc.id
  for_each = var.public_Subnet_CIDRs

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.tags, {
    "Name" = "Public-rt-${index(tolist(var.public_Subnet_CIDRs), each.value)+1}"
  })
}

resource "aws_route_table_association" "rta" {
  for_each       = var.public_Subnet_CIDRs
  route_table_id = aws_route_table.rt[each.value].id
  subnet_id      = aws_subnet.pbl_subnets[each.value].id
}