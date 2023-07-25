
resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-ec2-sg"
  description = "${var.name}-ec2-sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Any Open"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-ec2-sg"
  }
}