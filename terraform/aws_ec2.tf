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
  instance_type   = "t2.nano"
  key_name        = aws_key_pair.ec2-key.key_name
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.main_security_public.id, aws_security_group.main_security_remote.id]

  user_data_base64 = filebase64("./files/userdata.sh")
  user_data_replace_on_change = true
  monitoring = false

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    kms_key_id            = ""
    throughput            = "125"
    volume_size           = 10
    volume_type           = "gp3"
    iops                  = "3000"
    tags = {
      "key" = "value"
    }
  }
  
  tags = {
    "key" = "value"
  }
}

resource "aws_key_pair" "ec2-key" {
  key_name   = "webserver-prd"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbQrQrIVCSnh88V6JgfgueD+7F+rvAPFb5pAbNSGSfhTkG4BxgJHtSEsxoJFOODBO+/sqTw9BKeRjkInzt/p6KmgCi1a/ZsKGdysp5T6cdrQyNqPVjAF9DXwNcl94DrwpVqiwYoA3qgHu2LAQPRSoGQIfd4spHfQC/MncLcZMa+t2UDtfTX/WRIyxjjAvAXzFHQQyqQObKc8L5Xm5F/CRdRq6goK+b7VfgRcDEIFTfw8wBHCaEmYsov643h2eRyh8EAl2TiEGL7vlSZzI4iu6RcIvklfnWNnqZh63h5yFoF65OaJw60lf4VSnmLV1x2dcIc0Vk3qdp5HbsvZkxG7Id rsa-key-20230328"
}
