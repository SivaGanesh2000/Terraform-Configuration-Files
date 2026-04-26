region   = "us-east-1"
vpc_cidr = "10.0.0.0/16"

public_Subnet_CIDRs = ["10.0.0.0/28", "10.0.1.0/28"]
vpc_tags = {
  "Name" = "Dev-Test-VPC"
}