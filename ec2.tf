
resource "aws_instance" "ec2" {
  ami                    = "ami-0ea4d4b8dc1e46212"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = aws_subnet.public_a.id

  root_block_device {
    volume_size           = "10"
    volume_type           = "gp3"
    encrypted             = "true"
    delete_on_termination = "true"
    tags = {
      Name = "${var.name}-ec2-root-ebs"
    }
  }


  ebs_block_device {
    device_name           = "/dev/xvdb"
    volume_size           = "10"
    volume_type           = "gp3"
    delete_on_termination = "true"
    encrypted             = "true"
  }


  tags = {
    Name = "${var.name}-ec2"
  }
}