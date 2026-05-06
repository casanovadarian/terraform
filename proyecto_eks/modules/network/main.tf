resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "eks-vpc" }
}

resource "aws_subnet" "eks_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = { Name = "eks-subnet" }
}

output "subnet_id" {
  value = aws_subnet.eks_subnet.id
}