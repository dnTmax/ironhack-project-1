variable "public_key_path" {
  type    = string
  default = "~/.ssh/project-key.pub"
}
variable "my_ip" {
  type        = string
  description = "Ton IP publique en /32, utilisee pour le SSH"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
