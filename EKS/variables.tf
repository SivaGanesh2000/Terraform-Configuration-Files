variable "cluster_Name"{
    type= string
    description = "(REQUIRED) Name of the EKS Cluster"
    nullable = false
}

variable "cluster_version" {
  type = string
  description = "(REQUIRED) Version of the EKS Cluster"
  nullable = false
}

variable "node_Group_Name" {
  type = string
  description = "(REQUIRED) Name of the Node Group"
  nullable = false
}

variable "node_Group_Version" {
  type = string
  description = "(REQUIRED) Node Group Version"
  nullable = false
}

variable "instance_types" {
  type = list(string)
  description = "(REQUIRED) Instance Types for EC2 Node Group"
  nullable = false
}

variable "tags" {
  type = map(string)
  description = "(OPTIONAL) Tags for the cluster and node-groups"
}