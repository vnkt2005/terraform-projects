# create aws instance
# ssh connection
# ssh -i id_rsa ubuntu@52.87.202.40

resource "aws_instance" "web" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = "${self.public_ip}"
  }

  # file, local-exec, remote-exec
  provisioner "file" {
    source      = "readme.md"
    destination = "/tmp/readme.md"
  }

  # file, local-exec, remote-exec
  provisioner "file" {
    content = "this is my sample content"
    destination = "/tmp/content.md"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > xyz.txt"
  }

  provisioner "local-exec" {
    command = "dir > dirfiles.txt"
  }

  provisioner "local-exec" {
    working_dir = "e:\\terraproj\\aws-first-instance\\"
    interpreter = ["python", "-c"]
    command = "print('HelloWorld')"
  }


}

output "hello" {
  value = "the mysore"
}