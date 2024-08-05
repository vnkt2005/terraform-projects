# Docker installation on Ubuntu Server

```sh
    ssh -i id_rsa ubuntu@54.221.17.187
    $sudo apt update -y
    $sudo apt install docker.io -y
    $sudo systemctl status docker
    $docker run hello-world

    #add ubuntu user to docker group
    $sudo usermod -aG docker ubuntu
    #now logout and login again using ssh
    $docker run hello-world
    


```