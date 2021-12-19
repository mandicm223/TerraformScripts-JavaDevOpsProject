variable "cidr_block_vpc" {
  type = string
}

variable "cidr_block_subnet" {
  type = string
}

variable "ingress_ports" {
  type = list(string)
}

variable "amazon_machine_image" {
  type = string
}

variable "ec2_type" {
  type = string
}

variable "ec2_type_nexus" {
  type = string
}