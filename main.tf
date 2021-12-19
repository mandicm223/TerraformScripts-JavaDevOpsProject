terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~>3.0"
      }
  }
}


# configure the AWS provider

provider "aws" {
  region = "us-east-1"
}

# modules

module "network" {
  source = "./modules/NETWORK"
  cidr_vpc = var.cidr_block_vpc
  cidr_subnet = var.cidr_block_subnet
  ports = var.ingress_ports
}

module "instances" {
  source = "./modules/INSTANCES"
  machine_image = var.amazon_machine_image
  instance_type = var.ec2_type
  instance_type_nexus = var.ec2_type_nexus
  security_group_id = module.network.security_group_id
  subnet_id =  module.network.subnet_id
}
