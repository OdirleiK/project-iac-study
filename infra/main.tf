provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "securitygroup" {
  name = "securitygroup"
  description = "Permitir acesso HTTP e acesso a Internet"

  #tregra de entrada
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #liberando acesso a porta ssh 22
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 #tregra de saida
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypair" {
  key_name = "teraform-keypair"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "servidor" {
  ami            = "ami-0ba9883b710b05ac6"
  instance_type  = "t2.nano"
  user_data = file("user_data.sh")
  key_name = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [ aws_security_group.securitygroup.id ]
}