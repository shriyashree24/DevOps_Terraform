resource "aws_launch_configuration" "eks_worker_lc" {
  name          = "eks-worker-lc"
  image_id      = "ami-0a0e8e41c159fa8da" # Amazon EKS optimized AMI ID
  instance_type = "t2.medium"

  iam_instance_profile = aws_iam_instance_profile.eks_worker_instance_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "eks_worker_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  launch_configuration = aws_launch_configuration.eks_worker_lc.id
  vpc_zone_identifier  = aws_subnet.eks_subnet[*].id

  tag {
    key                 = "Name"
    value               = "eks-worker"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/my-eks-cluster"
    value               = "owned"
    propagate_at_launch = true
  }
}
