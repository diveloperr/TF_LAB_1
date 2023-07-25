

resource "aws_instance" "ec2_ebs" {
  ami                    = "ami-0ea4d4b8dc1e46212"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = aws_subnet.public_c.id

  root_block_device {
    volume_size           = "10"
    volume_type           = "gp3"
    encrypted             = "true"
    delete_on_termination = "true"
    tags = {
      Name = "${var.name}-ec2-root-ebs"
    }
  }


  tags = {
    Name = "${var.name}-ec2-ebs"
  }
}


resource "aws_ebs_volume" "ec2_data_volume" {
  availability_zone = "ap-northeast-2c"
  size              = "10"
  type              = "gp3"

  tags = {
    Name = "${var.name}-ec2-data-ebs"
  }
}


resource "aws_volume_attachment" "ebsAttach" {

  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.ec2_data_volume.id
  instance_id = aws_instance.ec2_ebs.id

}

