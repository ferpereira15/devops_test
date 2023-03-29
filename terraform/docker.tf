terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "local.tfstate"
  }
}


# declare any input variables
# defines variables in variables.tf
variable "api_port" {
  description = "api_port"
  default     = "80"
}
# override variable in File "terraform.tfvars" or in cli -var key=value or TF_NAME_var=value
#


# define provider
provider "docker" {}


# create docker volume resource
resource "docker_volume" "private_volume" {
  name = "my_volume"
}

# create docker network resource
resource "docker_network" "private_network" {
  name = "my_network"
}

# data registry image name
data "docker_registry_image" "nginx" {
  name = "nginx:stable"
}


# find docker image
resource "docker_image" "nginx" {
  keep_locally  = true
  name          = data.docker_registry_image.nginx.name
  pull_triggers = ["${data.docker_registry_image.nginx.sha256_digest}"]
}


# create web container
resource "docker_container" "web" {
  count = 2
  name = "web-${count.index+1}"
  image = docker_image.nginx.latest
  restart = "always"
  ports {
    internal = "80"
    external = var.api_port+count.index
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/scrapbook/tutorial/www"
    read_only = true
  }
  # env = ["POSTGRES_PASSWORD=${data.conjur_secret.admin-password.value}"]
}



# output
output "backend_state" {
  description = "The path to the backend state file"
  value       = "${path.module}/local.tfstate"
}

output "ip" {
  description = "Container ip"
  value       = "${docker_container.web.*.ip_address}"
}

output "port" {
  description = "Container port"
  value       = "${docker_container.web.*.ports}"
}