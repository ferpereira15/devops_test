output "public_ip_instance" {
    value = "http://${aws_instance.webservice_instance.public_ip}:8080"
    description = "Instace public IP"
}