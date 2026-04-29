data "aws_availability_zones" "zone" {

}

resource "aws_subnet" "pbl_subnets" {
  count = var.public_Subnet_CIDRs

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value

  availability_zone = data.aws_availability_zones.zone[count.index % length(data.aws_availability_zones.zone)]

  tags = merge(var.subnet_tags, var.tags, {
    Name = try(
      "${var.subnet_tags["Name"]}-Public-Subnet-${index(tolist(var.public_Subnet_CIDRs), each.value) + 1}",
      "Terraform-Public-${index(var.public_Subnet_CIDRs, each.value) + 1}"
    )
  })
}

resource "aws_subnet" "prvt_subnets" {
  count = var.private_Subnet_CIDRs

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value

  availability_zone = data.aws_availability_zones.zone[count.index % length(data.aws_availability_zones.zone)]

  tags = try(var.subnet_tags, var.tags, {
    Name = try(
      "${var.subnet_tags["Name"]}-Private-Subnet-${index(var.public_Subnet_CIDRs, each.value) + 1}",
      "Terraform-Privateclear-${index(var.public_Subnet_CIDRs, each.value) + 1}"
    )
  })
}