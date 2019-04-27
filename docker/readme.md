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
    docker run -itd -p 指定ip:port:port name  ...
    4.查看容器
    docker ps -a
    5.启动/关闭容器
    docker start/stop 容器id
    6.在运行的容器中执行命令
    docker exec -it 容器name bash
    7.删除容器
    docker rm name/id
    8.查找镜像
    docker search 镜像名
    9.设置镜像tag
    docker tag id name:tag信息
    10.查看端口绑定情况
    docker port name port

# 解决Docker时间与系统时间不同步

    CentOS
    echo "Asia/shanghai" > /etc/timezone;
    Ubuntu：
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    
