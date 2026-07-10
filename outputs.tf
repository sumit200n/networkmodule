output "VPC_ID" {
  value       = aws_vpc.my_vpc.id
  description = "VPC ID "
}

output "public_subnet_ids" {
  value = {
    for k,v in aws_subnet.var.public_subnets :
    k => v.id
  }
}

output "private_subnet_ids" {
  value = {
    for k,v in aws_subnet.private_subnets :
    k => v.id
  }
}