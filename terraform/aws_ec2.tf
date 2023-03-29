data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webservice_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [
  aws_security_group.main_security_public.id
  /* aws_security_group.main_security_remote.id */
   ]

  user_data_base64 = filebase64("./files/userdata.sh")
  user_data_replace_on_change = true
  monitoring = false

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    throughput            = "125"
    volume_size           = 10
    volume_type           = "gp3"
    iops                  = "3000"
    tags = {
      "project" = var.tag_project
    }
  }
  
  tags = {
    "project" = var.tag_project
  }
  
/* key_name        = aws_key_pair.ec2-key.key_name */
}

/* resource "aws_key_pair" "ec2-key" {
  key_name   = "webserver-prd"
  public_key = ""
} */
