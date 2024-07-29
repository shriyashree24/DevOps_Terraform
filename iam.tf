module "eks_iam" {
  source  = "terraform-aws-modules/eks/aws//modules/iam"
  version = "20.19.0"

  cluster_name = "eks-cluster"
  tags = {
    Name = "eks-iam"
  }
}
