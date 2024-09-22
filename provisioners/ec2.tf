resource "aws_instance" "terraform" {

  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = "terraform"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"
  }

  connection {
    host = self.public_ip
    type = "ssh"
    user = var.user_name
    password = var.password
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
     ]
  }

# for a graceful shutdown we can include the steps to stop certain processes before deleting the server
  provisioner "remote-exec" {
    when = destroy
    inline = [ 
      "sudo systemctl stop nginx"
     ]
  }

}


resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "allow ssh 22 ffrom terraform"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "allow_ssh"
  }

}