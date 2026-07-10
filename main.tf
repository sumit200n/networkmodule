resource "aws_vpc" "my_vpc" {
  cidr_block           = var.my_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge({ Cloud = "Sumit's cloud-${var.environment_tags}" }, local.sumit_project_tag)
}

resource "aws_subnet" "sumit_pvt_mysubnet" {

  for_each                = var.private_subnets
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true
  tags = {
    Name  = "${var.environment_tags}-pvt-Subnet-${each.key}-${each.value.az}"
    value = each.value.az
  }

}

resource "aws_subnet" "sumit_public_mysubnet" {

  for_each          = var.public_subnets
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name  = "${var.environment_tags}-public-Subnet-${each.key}-${each.value.az}"
    value = each.value.az
  }
    
}   