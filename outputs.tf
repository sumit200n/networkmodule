output "VPC_ID" {
  value       = aws_vpc.my_vpc.id
  description = "VPC ID "
}

# output "VPC_ID_CIDR_FOR_SUBNET" {

#   value = {


#     for k, v in var.var_subnet_name :
#     k => v.cidr

#   }
#   description = "VPC ID "
# }