resource "aws_instance" "this" {

    ami = "ami-0d31d7c9fc9503726"
    instance_type = "t2.micro"
    subnet_id =  var.subnet_id
    associate_public_ip_address = true

    tags = {
        "Name" = "${var.application_name}_public-ec2"
    }
  
}