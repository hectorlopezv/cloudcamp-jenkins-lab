resource "aws_key_pair" "linux-key-pair" {
  key_name   = "linux-key-pair"
  public_key = file("keys/id_rsa.pub")
}