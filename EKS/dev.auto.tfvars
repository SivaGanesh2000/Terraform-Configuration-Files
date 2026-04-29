cluster_Name = "EKS-GitOps"
cluster_version = "1.34"
cluster_role_name = "EKS-Cluster-Role"

node_Group_Name = "EKS-GitOps-Node-Group"
node_Group_Version = "1.34"
manag-pol-arn = [ "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
                    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
                    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" ]

instance_types = [ "t3.micro" ]

tags = {
    Description = "Created from Terraform for GitOps Task"
}