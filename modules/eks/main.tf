resource "aws_iam_role" "eks_cluster_role" {
    name = "${var.cluster_name}-cluster-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "eks.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_role_policy_attachment" {
    role = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "main" {
    name = var.cluster_name
    role_arn = aws_iam_role.eks_cluster_role.arn
    vpc_config {
        subnet_ids = var.subnet_ids
    }
    depends_on = [aws_iam_role_policy_attachment.eks_cluster_role_policy_attachment]
}

resource "aws_iam_role" "fargate_pod_role" {
    name = "${var.cluster_name}-node-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "eks-fargate-pods.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "ec2_cluster_role_policy_attachment" {
    role = aws_iam_role.fargate_pod_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

resource "aws_eks_fargate_profile" "name" {
    cluster_name = var.cluster_name
    fargate_profile_name = "ecommerce-fargate"
    pod_execution_role_arn = aws_iam_role.fargate_pod_role.arn
    subnet_ids = var.subnet_ids
    selector {
      namespace = "ecommerce"
    }
}

