provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
  public_subnets_cidr_blocks = var.public_subnets_cidr_blocks
  availability_zones = var.availability_zones
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids = module.vpc.private_subnets
}