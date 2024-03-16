resource "aws_instance" "jenkins-ec2" {
  ami                    = var.mapping.dv.ami_id
  instance_type          = var.mapping.dv.instance_type
  subnet_id              = aws_subnet.public_subnets["us-east-1a"].id
  vpc_security_group_ids = [aws_security_group.sg-jenkins-ssh-public.id, aws_security_group.sg-jenkins-https-http-public.id]
  user_data              = file("scripts/boot-script.sh")
  key_name               = aws_key_pair.linux-key-pair.key_name
  tags                   = merge(var.mapping.dv.general_tags, { Name = "ec2-${local.sufix}" })
}

output "my-public-ip" {
  value = aws_instance.jenkins-ec2.public_ip
  description = "Public IP address of the Jenkins instance"
}