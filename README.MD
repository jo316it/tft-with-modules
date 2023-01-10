# AWS EC2 TF

This code will create a little infrastructure in AWS with:

* One VPC with address 192.168.0./24 (can be modified)
* Two Subnets (192.168.0.0/25 and 192.168.0.128/25)
* One Internet Gateway and Route Tables
* One EC2 of type T2.micro (Elegible on Free Tier)
* SSH keys to access

Almost all dymamic data can be modified through the files "local.tf" and variables.tf inside of the modules directory.

Important: Inside the "keys" directory in the EC2 module, there is a shell script that generates a pair of keys to access the instance.
Remember to change the name in the file() function so the code can copy the public key to the instance