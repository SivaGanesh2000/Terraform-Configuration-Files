cluster_Name = "EKS-GitOps"
cluster_version = "1.3.1"

node_Group_Name = "EKS-GitOps-Node-Group"
node_Group_Version = "1.3.1"

instance_types = [ "t3.micro" ]

tags = {
    Description = "Created from Terraform for GitOps Task"
}