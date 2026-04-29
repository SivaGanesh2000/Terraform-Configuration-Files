module "iam_role" {
  source = "../IAM_Role"

  assume-role-policy = file("./assume-pol.yaml")
  role_name = var.cluster_role_name
}

module "node_iam_role" {
  source = "../IAM_Role"
  
  assume-role-policy = file("./node-assume-pol.yaml")
  role_name = length(var.node_role_name) >0 ? var.node_role_name: "${var.cluster_role_name}-Node-Group"
  manag-policy-arn = var.manag-pol-arn
}

module "vpc" {
  source = "../VPC_Module"

  region = "us-east-1"
  vpc_cidr = "10.0.0.0/16"

  public_Subnet_CIDRs = ["10.0.0.0/24", "10.0.1.0/28"]
  vpc_tags = {
    Name = "EKS-VPC"
  }

  subnet_tags = {
    Name = "EKS"
  }

  IGW_tags = {
    Name = "EKS-Igw"
  }
}
