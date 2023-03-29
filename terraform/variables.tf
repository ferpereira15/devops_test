variable "instance_type" {
    type = string
    default = "t2.nano"
}

variable "volume_size" {
    type = number
    default = 10  
}

variable "tag_project" {
    type = string
    default = "devops_test"
}

variable "public_key" {
    type = string
    default = ""
}

variable "region" {
    type = string
    default = "sa-east-1"
}
