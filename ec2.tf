resource "aws_instance" "web" {
  ami                         = "ami-0d593311db5abb72b"
  instance_type               = "t2.micro"
  key_name                    = "keypair"
  subnet_id                   = aws_subnet.public_web_subnet[count.index].id
  vpc_security_group_ids      = [aws_security_group.public_web_sg.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "web-server"
  }

  provisioner "file" {
    source      = "./keypair.pem"
    destination = "/home/ec2-user/keypair.pem"

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./keypair.pem")
    }
  }
}

/* resource "aws_instance" "app" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  key_name = "pswain"
  subnet_id = aws_subnet.private_app_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.private_app_sg.id]
  count = 2

  tags = {
    Name = "app-server"
  }

} */

resource "aws_instance" "db" {
  ami                    = "ami-0d593311db5abb72b"
  instance_type          = "t2.micro"
  key_name               = "keypair"
  subnet_id              = aws_subnet.private_db_subnet[0].id
  vpc_security_group_ids = [aws_security_group.private_db_sg.id]

  tags = {
    Name = "db-server"
  }
}