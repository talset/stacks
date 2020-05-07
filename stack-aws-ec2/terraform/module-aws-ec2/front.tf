resource "aws_security_group" "front" {
  name        = "${var.project}-front-${var.env}"
  description = "Front ${var.env} for ${var.project}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # TMP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "cycloid.io" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/userdata.sh.tpl")

  vars = {
    git_code_commit = var.git_code_commit
    git_code_repo   = var.git_code_repo
    project         = var.project
  }
}

resource "aws_instance" "front" {
  ami                         = data.aws_ami.debian.id
  user_data_base64            = base64encode(data.template_file.user_data.rendered)
  associate_public_ip_address = true
  instance_type               = var.front_type
  vpc_security_group_ids      = [aws_security_group.front.id]

  tags = {
    Name         = "cycloid test"
    "cycloid.io" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
}
