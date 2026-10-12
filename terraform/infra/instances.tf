data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  private_ip             = local.ips.frontend
  vpc_security_group_ids = [aws_security_group.frontend.id]
  key_name               = aws_key_pair.main.key_name
  tags                   = { Name = "${local.project}-frontend" }
}

resource "aws_instance" "backend" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_app.id
  private_ip             = local.ips.backend
  vpc_security_group_ids = [aws_security_group.backend.id]
  key_name               = aws_key_pair.main.key_name
  tags                   = { Name = "${local.project}-backend" }
}

resource "aws_instance" "database" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_db.id
  private_ip             = local.ips.database
  vpc_security_group_ids = [aws_security_group.database.id]
  key_name               = aws_key_pair.main.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  tags = { Name = "${local.project}-database" }
}
