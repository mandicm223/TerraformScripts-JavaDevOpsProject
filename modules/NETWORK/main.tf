# create a VPC resource

resource "aws_vpc" "myLab-VPC" {
  cidr_block = var.cidr_vpc
  tags = {
      "Name" = "myLab-VPC"
  }
}

# create Subnet resource ( public )

resource "aws_subnet" "myLab-Subnet1" {
  vpc_id = aws_vpc.myLab-VPC.id
  cidr_block = var.cidr_subnet
  tags = {
      "Name" = "myLab-Subnet"
  }
}


# create Internet-gateway resource

resource "aws_internet_gateway" "myLab-Internet_gateway" {
  vpc_id = aws_vpc.myLab-VPC.id
  tags = {
      "Name" = "myLab-Internet_gateway"
  }
}


# create security-group resource

resource "aws_security_group" "myLab-security_group" {
  name = "myLab-security_group"
  description = "To allow inbound and outbound traffic to my lab."

  vpc_id = aws_vpc.myLab-VPC.id

  dynamic ingress {
      iterator = port
      for_each = var.ports
        content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
      
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      "Name" = "Allow traffic"
  }
}


# create aws route table resource

resource "aws_route_table" "myLab-RouteTable" {
  vpc_id = aws_vpc.myLab-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myLab-Internet_gateway.id
  }

  tags = {
    "Name" = "myLAb-RouteTable"
  }
}


# create aws route table association

resource "aws_route_table_association" "myLab-route_table_association" {
  subnet_id = aws_subnet.myLab-Subnet1.id
  route_table_id = aws_route_table.myLab-RouteTable.id
}
