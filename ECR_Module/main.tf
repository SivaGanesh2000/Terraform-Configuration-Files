resource "aws_ecr_repository" "ecr"{
    name = var.ECR_repo_name

    image_scanning_configuration {
      scan_on_push = true
    }
}