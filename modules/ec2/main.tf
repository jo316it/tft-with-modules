resource "aws_key_pair" "this" {

  key_name   = "${var.application_name}-key-pair"
  public_key = file("./modules/ec2/keys/juice-key-pair.pub")


}


resource "aws_security_group" "juice_sg_ssh" {

  name   = "${var.application_name}-juice-sg-ssh"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

  }

  egress  {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"

  }


}

resource "aws_instance" "this" {

  ami                         = "ami-0d31d7c9fc9503726"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  security_groups             = [aws_security_group.juice_sg_ssh.id]
  tags = {
    "Name" = "${var.application_name}_public-ec2"
  }

}