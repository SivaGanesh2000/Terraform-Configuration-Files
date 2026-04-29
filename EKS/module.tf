module "iam_role" {
  source = "../IAM_Role"

  assume_role_policy = file("./assume-pol.txt")
  role_name = var.cluster_role_name
}

module "iam_role" {
  source = "../IAM_Role"

  assume_role_policy = file("./assume-pol.txt")
  role_name = var.cluster_role_name
}

module "iam_role" {
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
