resource "aws_security_group" "sas-dev-sg" {
  vpc_id      = aws_vpc.sas_dev.id
  name        = "sas-dev-sg-only-t1a"
  description = "security group that allows all inbound traffic for t1a"

  # outbound left as default
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # inbound rules
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.t1a_ips_lst
    description = "all from T1A vpn,T1A office, pub-subnet1"
  }
  tags = {
    Name = "sas-uat-sg-only-t1a"
  }
}