variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_PROFILE_NAME" {
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0323c3dd2da7fb37d"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}