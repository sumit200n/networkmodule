
#if you do not define the variable type it will take the same as string

variable "project"{

}
variable "environment"{

}
variable "tags" {
    type = map(string)

}

variable "my_vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

locals {
  sumit_project_tag = {
    Project     = "SKG Terraform Cloud"
    Environment = "Dev"
    owner       = "Sumit"
    Name        = "skg-${var.environment_tags}"
  }
} 

  variable "environment_tags" {
  description = "Common tags applied to all AWS resources"

  type = string

  default = ""
}
variable "public_subnets" {
  description = "The name of the public subnet"

  type = map(object({
    az   = string
    cidr = string
  }))

default = {
    subnet_public_1 = {
      az   = "us-east-2a"
      cidr = "10.0.10.0/24"
    }
}
}

variable "private_subnets" {
  description = "The name of the private subnet"

  type = map(object({
    az   = string
    cidr = string
  }))

default = {
    subnet_pvt_1 = {
      az   = "us-east-2b"
      cidr = "10.0.11.0/24"
    }
}
}

