resource "aws_key_pair" "astanil_key" {
  key_name   = "astanil-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "master" {
  ami           = var.debian_11_3
  instance_type = "t2.micro"

  key_name  = aws_key_pair.astanil_key.key_name

  vpc_security_group_ids = [ 
    aws_security_group.db_server_sg.id
  ]

  tags = {
    Name = "terraform-web-1"
  }
}

resource "aws_instance" "replica" {
  ami           = var.debian_11_3
  instance_type = "t2.micro"

  key_name  = aws_key_pair.astanil_key.key_name

  vpc_security_group_ids = [ 
    aws_security_group.db_server_sg.id
  ]

  tags = {
    Name = "terraform-web-2"
  }
}