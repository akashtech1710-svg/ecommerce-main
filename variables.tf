variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets_cidr_blocks" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets_cidr_blocks" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "availability_zones" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "cluster_name" {
  description = "name of the cluster"
  type        = string
  default     = "ecommerce-cluster"
}