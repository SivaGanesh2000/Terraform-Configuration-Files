terraform{

    backend "s3" {
      bucket = "terraform-state-files-912388441087-us-east-1-an"
      key = "{terraform.workspace}/ECR.tfstate"
      profile = "devops-profile"
      region = "us-east-1"
      use_lockfile = true
    }

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.22.0"
      }
    }
}

provider "aws"{
    region = var.region

    profile = "devops-profile"
}