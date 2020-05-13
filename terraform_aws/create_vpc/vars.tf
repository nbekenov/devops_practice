variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_PROFILE_NAME" {
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "terraformkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "terraformkey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0323c3dd2da7fb37d"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}

variable "dhcp_domain_name" {
}

variable "simple_ad_pass" {
}

variable "domain_name" {
}

variable "t1a_ips_lst" {
}