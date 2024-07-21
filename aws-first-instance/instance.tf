/*
# creating ssh-key.
resource "aws_key_pair" "key-tf" {
    key_name = "key-tf"
    public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
    value = "${aws_key_pair.key-tf.key_name}"
}

resource "aws_instance" "web" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key-tf.key_name}"
  tags = {
    Name = "first-tf-instance"
  }
}
*/

output "hello" {
    value = "the mysore"
}