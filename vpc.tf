resource "aws_vpc" "Terraform_intsance" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"

    tags = {
        Name = "Terraform_instance"
    }
}

resource "aws_subnet" "TF_ins_public" {
    vpc_id = aws_vpc.Terraform_intsance.id
    cidr_block = "10.0.0.1/27"
    tags = {
      Name = "TF_ins_public"
    }
}

resource "aws_route_table" "TF_ins_public_RT" {
    vpc_id = aws_vpc.Terraform_intsance.id
    tags = {
      Name = "TF_ins_public_RT"
    }
}

resource "aws_route" "TF_ins_public_RT.routes" {
    route_table_id = aws_route_table.TF_ins_public_RT.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0e7f30c882a232fc9"
}

resource "aws_route_table_association" "TF_ins_public_RT.routes.assoc" {
    subnet_id = aws_subnet.TF_ins_public.id
    route_table_id = aws_route_table.TF_ins_public_RT.id
}

resource "aws_security_group" "Terraform_intsance_SG" {
    name = "Allow-TCP"
    description = "Allow TCP inbound traffic and all outbound traffic"
    vpc_id = aws_vpc.Terraform_intsance.id
    tags = {
      Name = "Terraform_intsance_SG"
    }
}

resource "aws_vpc_security_group_ingress_rule" "ALL TcP" {
    security_group_id = aws_security_group.Terraform_intsance_SG.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Terraform_intsance_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}