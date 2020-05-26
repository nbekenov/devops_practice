resource "aws_security_group" "example" {
  name = "example"
  dynamic "ingress" {
    for_each = [22, 443]
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "-1"
    }
  }
}