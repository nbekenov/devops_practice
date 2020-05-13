# create EFS
resource "aws_efs_file_system" "sas-uat-efs" {
  creation_token   = "sas-uat"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "false"
  tags = {
    Name = "UAT-EFS"
  }
}
# mount target
resource "aws_efs_mount_target" "sas-uat-efs-mt" {
  file_system_id  = aws_efs_file_system.sas-uat-efs.id
  subnet_id       = aws_subnet.sas-dev-publicsub-2.id
  security_groups = [aws_security_group.sas-dev-sg.id]
}