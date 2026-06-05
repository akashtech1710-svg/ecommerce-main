variable "cidr_block" {
  description = "CIDR block for the vpc"
  type        = string
}

variable "private_subnets_cidr_blocks" {
  description = "Values of the private subnets CIDR blocks"
  type        = list(string)
}

variable "public_subnets_cidr_blocks" {
  description = "Values of the public subnets CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "Values of the availability zones"
  type        = list(string)
}