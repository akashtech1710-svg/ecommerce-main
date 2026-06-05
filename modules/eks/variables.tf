variable "cluster_name" {
  description = "name of the cluster"
  type        = string
}

variable "subnet_ids" {
  description = "name of the subnets"
  type        = list(string)
}