module "red" {
  source = "./modules/networking"
}

module "servidor" {
  source    = "./modules/compute"
  count     = 2
  vpc_id    = module.red.vpc_id
  subnet_id = module.red.subnet_id
  id_servidor = count.index + 10
}