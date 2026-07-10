locals {
  port = [22, 80, 443]
}


resource "aws_security_group" "web_sg" {
  name   = "my-web-sg"
  vpc_id = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = local.port

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.port

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }


  }
}
# resource "aws_security_group" "web_sg" {
#   name = "my-web-sg"
#   ingress = {
#     from_port  = 22
#     to_port    = 22
#     protocol   = "tcp"
#     cidr_block = ["0.0.0.0/0"]
#   }

# }

resource "aws_security_group" "alb_sg" {
  name        = "my-alb-sg"
  description = "allow http traffice to alb"
  vpc_id      = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = local.port

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  dynamic "egress" {
    for_each = local.port

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }


  }
}