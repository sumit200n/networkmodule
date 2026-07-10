output "VPC_ID" {
  value       = aws_vpc.my_vpc.id
  description = "VPC ID "
}

output "public_subnet_ids" {
  value = {
    for k,v in aws_subnet.sumit_public_mysubnet
    k => v.id
  }
}

output "private_subnet_ids" {
  value = {
    for k,v in aws_subnet.aws_subnet.sumit_pvt_mysubnet :
    k => v.id
  }
}