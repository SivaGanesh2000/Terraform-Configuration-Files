resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(var.vpc_tags, var.tags,
    {
      Name = try(var.vpc_tags["Name"], "Terraform-VPC")
  })
}