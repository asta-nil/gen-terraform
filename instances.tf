resource "aws_key_pair" "astanil_key" {
  key_name   = "astanil-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami           = var.debian_11_3
  instance_type = "t2.micro"

  key_name  = aws_key_pair.astanil_key.key_name

  vpc_security_group_ids = [ 
    aws_security_group.web_server_sg.id
  ]

  tags = {
    Name = "terraform-web"
  }
}