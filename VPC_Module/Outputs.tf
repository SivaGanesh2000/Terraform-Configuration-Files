output "VPC_Details" {
  value = {
    "VPC_Id"   = aws_vpc.vpc.id
    "VPC_CIDR" = aws_vpc.vpc.cidr_block
    "VPC_Name" = aws_vpc.vpc.tags["Name"]
  }
}

output "Public_Subnet_Details" {
  value = { for subnet in aws_subnet.pbl_subnets : subnet.tags["Name"] => {
    "Id"   = subnet.id
    "Cidr" = subnet.cidr_block
  } }
}

output "Private_Subnet_Details" {
  value = { for subnet in aws_subnet.prvt_subnets : subnet.tags["Name"] => {
    "Id"   = subnet.id
    "Cidr" = subnet.cidr_block
  } }
}