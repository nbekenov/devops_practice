resource "aws_directory_service_directory" "sasdev_ad" {
  name     = var.domain_name
  password = var.simple_ad_pass
  size     = "Small"
  type     = "SimpleAD"

  vpc_settings {
    vpc_id     = aws_vpc.sas_dev.id
    subnet_ids = ["${aws_subnet.sas-dev-publicsub-1.id}", "${aws_subnet.sas-dev-publicsub-2.id}"]
  }

  tags = {
    Name = "sas-uat-ad"
  }

  provisioner "local-exec" {
    command = "echo ${aws_directory_service_directory.sasdev_ad.dns_ip_addresses} >> dns_ip_addresses.txt"
  }
}

output "dns_ip_addresses" {
  value = [sort(aws_directory_service_directory.sasdev_ad.dns_ip_addresses)[0], sort(aws_directory_service_directory.sasdev_ad.dns_ip_addresses)[1], "AmazonProvidedDNS"]
}