# Ubuntu安装Docker

    1. sudo apt install docker.io
    2. systemctl docker start
    3. systemctl enable docker

## 更改镜像源

    1.sudo vim /etc/docker/daemon.json
    2.添加配置信息
    {
      "registry-mirrors":  
      ["https://docker.mirrors.ustc.edu.cn"]
    } 

## 常用命令

    1.拉取镜像
    docker pull mysql:5.6
    2.查看镜像
    docker images
    3.运行镜像(会得到一个容器)
    docker run -itd -P mysql:5.6 bash
    4.查看容器
    docker ps -a
    5.启动/关闭容器
    docker start/stop 容器id
    6.在运行的容器中执行命令
    docker exec -it 容器name bash
    
