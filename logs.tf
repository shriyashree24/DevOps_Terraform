resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = module.eks_iam.this_eks_cluster_role_arn
  vpc_config {
    subnet_ids = module.vpc.private_subnets
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
}
