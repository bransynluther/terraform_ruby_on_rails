provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-09479453c5cde9639"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  key_name = "${var.ami_key_pair_name}"

tags {
    Name = "${var.ami_name}"
  }

subnet_id = "${aws_subnet.subnet-uno.id}"
}
