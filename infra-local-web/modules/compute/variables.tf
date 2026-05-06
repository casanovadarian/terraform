variable "vpc_id" {}
variable "subnet_id" {}
variable "tipo_instancia" {
  default = "t2.micro"
}
variable "id_servidor" {
  type    = number
  default = 0
}