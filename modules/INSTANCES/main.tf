
# create aws EC2 instance resource Jenkins

resource "aws_instance" "EC2-Jenkins" {
  ami = var.machine_image
  instance_type = var.instance_type
  key_name = "OVAJKEYKORISTI"
  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  user_data = file("./modules/INSTANCES/installationScripts/installJenkins.sh")

  tags = {
    Name = "EC2-Jenkins"
  }
  
}

/*
  BEST PRACTICE FOR REAL_WORLD PROJECT
resource "aws_eip" "Jenkins-EIP" {
  instance = aws_instance.MyLab-EC2-Jenkins.id
  VPC = true
}

*/



# create aws EC2 instance resource AnsibleControllerNode

resource "aws_instance" "EC2-AnsibleController" {
  ami = var.machine_image
  instance_type = var.instance_type
  key_name = "OVAJKEYKORISTI"
  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  user_data = file("./modules/INSTANCES/installationScripts/installAnsibleController.sh")

  tags = {
    Name = "EC2-AnsibleController"
  }
  
}


# create aws EC2 instance resource AnsibleManagedNode - APACHE

resource "aws_instance" "EC2-AnsibleApache" {
  ami = var.machine_image
  instance_type = var.instance_type
  key_name = "OVAJKEYKORISTI"
  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  user_data = file("./modules/INSTANCES/installationScripts/installAnsibleTomcat.sh")

  tags = {
    Name = "EC2-AnsibleApache"
  }
  
}


# create aws EC2 instance resource AnsibleManagedNode - DOCKER

resource "aws_instance" "EC2-AnsibleDocker" {
  ami = var.machine_image
  instance_type = var.instance_type
  key_name = "OVAJKEYKORISTI"
  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  user_data = file("./modules/INSTANCES/installationScripts/installAnsibleDocker.sh")

  tags = {
    Name = "EC2-AnsibleDocker"
  }
  
}


# create aws EC2 instance resource - Sonatype Nexus

resource "aws_instance" "EC2-Nexus" {
  ami = var.machine_image
  instance_type = var.instance_type_nexus
  key_name = "OVAJKEYKORISTI"
  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  user_data = file("./modules/INSTANCES/installationScripts/installNexus.sh")

  tags = {
    Name = "EC2-Nexus"
  }
  
}


# create aws EC2 resource - Sonarqube

resource "aws_instance" "EC2-Sonarqube" {
  ami = var.machine_image
  instance_type = var.instance_type_nexus
  key_name = "OVAJKEYKORISTI"
  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  user_data = file("./modules/INSTANCES/installationScripts/installSonarqube.sh")

  tags = {
    Name = "EC2-Sonarqube"
  }
  
}