resource "aws_instance" "Terraform_intsance" {
    ami = "ami-08ee1453725d19cdb"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = "TF-Key"
    security_groups = "sg-0170ac61ae85a8407"
    subnet_id = aws_subnet.TF_ins_public.id
    vpc_security_group_ids = aws_security_group.Terraform_intsance_SG.id
    tags = {
      Name = "Terraform_intsance"
    }
  }