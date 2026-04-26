resource "aws_subnet" "pbl_subnets" {
  for_each = var.public_Subnet_CIDRs

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value

  tags = merge(var.subnet_tags, var.tags, {
    Name = try(
      "${var.subnet_tags["Name"]}-Public-Subnet-${index(tolist(var.public_Subnet_CIDRs), each.value) + 1}",
      "Terraform-Public-${index(var.public_Subnet_CIDRs, each.value) + 1}"
    )
  })
}

resource "aws_subnet" "prvt_subnets" {
  for_each = var.private_Subnet_CIDRs

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value

  tags = try(var.subnet_tags, var.tags, {
    Name = try(
      "${var.subnet_tags["Name"]}-Private-Subnet-${index(var.public_Subnet_CIDRs, each.value) + 1}",
      "Terraform-Privateclear-${index(var.public_Subnet_CIDRs, each.value) + 1}"
    )
  })
}