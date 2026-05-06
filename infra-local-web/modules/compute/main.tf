# El Firewall del servidor
resource "aws_security_group" "web_sg" {
  name   = "sg_web_${var.id_servidor}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# La computadora (Instancia EC2)
resource "aws_instance" "servidor" {
  ami           = "ami-005e54dee72cc1d00" # LocalStack acepta cualquier ID
  instance_type = var.tipo_instancia
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = { Name = "Servidor-Web-Modular-${var.id_servidor}" }
}