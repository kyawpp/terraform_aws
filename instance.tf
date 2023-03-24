resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "terraform_instance" {
  ami = "${lookup(var.AMIS,var.AWS_REGION)}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0b044cc9b5b26b249"]
  subnet_id = "subnet-0841b8e3c5d1e4db9"
  key_name = "${aws_key_pair.mykey.key_name}"

  provisioner "file" {
   source="script.sh"
   destination="/tmp/script.sh"
  }
  provisioner "remote-exec" {
   inline=[
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
   ]
  }
  connection{
    host = self.public_ip
    type = "ssh"
   user= "${var.INSTANCE_USER_NAME}"
   private_key="${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
