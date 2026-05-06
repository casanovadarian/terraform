variable "subnet_id" {} # Recibirá el dato del módulo de red

resource "aws_iam_role" "eks_role" {
  name = "eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "eks.amazonaws.com" } }]
  })
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "mi-cluster-local"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [var.subnet_id]
  }
}