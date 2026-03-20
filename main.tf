resource "aws_instance" "instance" {
  for_each = var.components
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09b871cf63e2bb80b"]

  tags = {
    Name = var.components[each.key]
  }
}

# resource "aws_route53_record" "dns" {
#   for_each = var.components
#   zone_id = "Z08243203OP3MKK8XQJHA"
#   name    = "${var.components[each.key]}-dev"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.instance[each.key].private_ip]
# }

variable "components" {
  default = {
    portfolio-service = ""
    frontend = ""
    postgresql = ""
    auth-service = ""
    analytics-service = ""
  }
}



