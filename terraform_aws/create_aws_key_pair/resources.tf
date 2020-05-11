resource "aws_key_pair" "terraformkey" {
  key_name   = "terraformkey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}