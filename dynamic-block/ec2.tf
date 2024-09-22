resource "aws_instance" "terraform" {
  for_each               = var.instnace
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = each.key
  }
}


resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "allow ssh 22 ffrom terraform"

  dynamic "egress" {
    for_each = var.egress
    content {
      from_port        = egress.value["from_port"]
      to_port          = egress.value["to_port"]
      protocol         = egress.value["protocol"]
      cidr_blocks      = egress.value["cidr_blocks"]
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks    # can also call using dot(.) without []
    }
  }

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"]
      ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]
    }
  }

  tags = {
    "Name" = "allow_ssh"
  }

}