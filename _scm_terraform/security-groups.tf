### SSH SG
resource "aws_security_group" "sg-jenkins-ssh-public" {

  vpc_id = aws_vpc.vpc-terraform.id
  tags =  merge(var.mapping.dv.general_tags, { Name = "sg-ssh-${local.sufix}" })

}

resource "aws_security_group_rule" "rule-ingress-jenkins-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.mapping.dv.my_public_ip]
  security_group_id = aws_security_group.sg-jenkins-ssh-public.id

}

resource "aws_security_group_rule" "rule-egress-ssh-allow-all" {
  security_group_id = aws_security_group.sg-jenkins-ssh-public.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]

}

### HTTPS AND HTTP SG
resource "aws_security_group" "sg-jenkins-https-http-public" {

  vpc_id = aws_vpc.vpc-terraform.id
  tags =  merge(var.mapping.dv.general_tags, { Name = "sg-http/s-${local.sufix}" })

}

resource "aws_security_group_rule" "rule-ingress-jenkins-https" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = [var.mapping.dv.my_public_ip]
  security_group_id = aws_security_group.sg-jenkins-https-http-public.id

}

resource "aws_security_group_rule" "rule-ingress-jenkins-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.mapping.dv.my_public_ip]
  security_group_id = aws_security_group.sg-jenkins-https-http-public.id

}

resource "aws_security_group_rule" "rule-egress-jenkins-allow_all" {
  security_group_id = aws_security_group.sg-jenkins-https-http-public.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]

}