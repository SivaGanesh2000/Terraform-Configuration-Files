resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.IGW_tags, var.tags, {
    Name = try(var.IGW_tags["Name"], "Terrafor-IGW")
  })
}
