output "public_ip_instance" {
    value = "${aws_instance.webservice_instance.public_ip}:8080"
    description = "Instace public IP"
}