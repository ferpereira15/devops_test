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

variable "shared_credentials_files" {
    type = list(string)
    default = "C:/Users/Fer/.aws/credentials" 
}

variable "shared_config_files" {
    type = list(string)
    default = "C:/Users/Fer/.aws/config"
}

variable "region" {
    type = string
    default = "sa-east-1"
}

variable "profile" {
    type = string
    default = "tf"
}


