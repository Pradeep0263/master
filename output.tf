output "Instance_public_ip" {
    description = "Public Ip of the TF instance"
    value = aws_instance.Terraform_intsance.public_ip
}

output "Instance_ID" {
    description = "ID of the TF instance"
    value = aws_instance.Terraform_intsance.id
}

output "Instance_device_name" {
    description = "device_name of the TF instance"
    value = aws_instance.Terraform_intsance.device_name
}