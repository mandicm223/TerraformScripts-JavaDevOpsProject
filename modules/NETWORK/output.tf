output "security_group_id" {
  value = aws_security_group.myLab-security_group.id
}

output "subnet_id" {
    value = aws_subnet.myLab-Subnet1.id
}