resource "aws_route_table" "rt" {
  vpc_id   = aws_vpc.vpc.id
  count = length(var.public_Subnet_CIDRs)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.tags, {
    "Name" = "Public-rt-$count.index+1}"
  })
}

resource "aws_route_table_association" "rta" {
  count     = length(var.public_Subnet_CIDRs)
  route_table_id = aws_route_table.rt[count.index].id
  subnet_id      = aws_subnet.pbl_subnets[count.index].id
}