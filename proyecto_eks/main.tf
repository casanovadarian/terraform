# 1. Llamamos al módulo de red
module "mi_red" {
  source = "./modules/network"
}

# 2. Llamamos al módulo EKS y le pasamos el dato de la red
module "mi_eks" {
  source    = "./modules/eks"
  subnet_id = module.mi_red.subnet_id # Conexión entre módulos
}