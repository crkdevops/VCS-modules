module "aws-compute" {
  source = "git::git@github.com:deanhouaripower/Terraform-modules.git//aws_EC2?ref=v2.0"

  type = "t2.micro"
  ami = data.aws_ami.ami.id
  az = "us-east-2a"
  fwname = "sg_prod2"
  ingressmap = var.ingressprod
  secgrp = module.aws-compute.secgrp
  tags = "ec2-prod"
}

module "gcp-compute"{
  source = "git::git@github.com:deanhouaripower/Terraform-modules.git//gcp_VM?ref=v2.0"

  image = "debian-cloud/debian-9"
  machine = "n1-standard-1"
  name = "gcp-vm-prod"
}

resource "aws_vpc" "vpc-mod" {
  cidr_block = "172.40.0.0/16"
}

