resource "aws_security_group" "ec2" {
  name        = "${var.project}-ec2-${var.env}"
  description = "ec2 ${var.env} for ${var.project}"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    cycloid.io = "true"
    Name       = "${var.project}-ec2-${var.env}"
    env        = "${var.env}"
    project    = "${var.project}"
    role       = "ec2"
  }
}

resource "aws_security_group_rule" "public_to_ssh" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec2.id}"
}

###

# EC2

###

resource "aws_instance" "ec2" {
  ami = "${data.aws_ami.debian.id}"

  associate_public_ip_address = true

  #iam_instance_profile        = "${aws_iam_instance_profile.front_profile.name}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.keypair_name}"
  ebs_optimized = "true"

  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

  subnet_id = "${element(var.public_subnets_ids, count.index)}"

  root_block_device {
    volume_size           = 15
    volume_type           = "gp2"
    delete_on_termination = true
  }

  volume_tags {
    cycloid.io = "true"
    Name       = "${var.project}-ec2-${count.index}-${var.aws_region}-${var.env}"
    env        = "${var.env}"
    project    = "${var.project}"
    role       = "ec2"
  }

  tags {
    cycloid.io = "true"
    Name       = "${var.project}-ec2-${count.index}-${var.aws_region}-${var.env}"
    env        = "${var.env}"
    project    = "${var.project}"
    role       = "ec2"
  }
}
