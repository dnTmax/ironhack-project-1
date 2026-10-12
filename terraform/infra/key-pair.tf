resource "aws_key_pair" "main" {
  key_name   = "${local.project}-key"
  public_key = file(pathexpand(var.public_key_path))
}