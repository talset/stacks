data "template_file" "user_data" {
  template = file("${path.module}/userdata.sh.tpl")

  vars = {
    env             = var.env
    project         = var.project
  }
}

resource "aws_instance" "front" {
  ami                         = data.aws_ami.debian.id
  user_data_base64            = base64encode(data.template_file.user_data.rendered)
  associate_public_ip_address = false
  instance_type               = var.front_type

  tags = {
    Name         = "cycloid test"
    "cycloid.io" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
}
