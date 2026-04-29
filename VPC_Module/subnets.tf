data "aws_availability_zones" "zone" {

}

resource "aws_subnet" "pbl_subnets" {
  count = length(var.public_Subnet_CIDRs)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_Subnet_CIDRs[count.index]
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.zone.names[count.index % length(data.aws_availability_zones.zone.names)]

  tags = merge(var.subnet_tags, var.tags, {
    Name = try(
      "${var.subnet_tags["Name"]}-Public-Subnet-${count.index + 1}",
      "Terraform-Public-${count.index + 1}"
    )
  })
}

resource "aws_subnet" "prvt_subnets" {
  count = length(var.private_Subnet_CIDRs)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_Subnet_CIDRs[count.index]

  availability_zone = data.aws_availability_zones.zone.names[count.index % length(data.aws_availability_zones.zone.names)]

  tags = try(var.subnet_tags, var.tags, {
    Name = try(
      "${var.subnet_tags["Name"]}-Private-Subnet-${count.index + 1}",
      "Terraform-Privateclear-${count.index + 1}"
    )
  })
}