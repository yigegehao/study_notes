# Docker Register
    sudo docker login --username=yigegehao registry.cn-hangzhou.aliyuncs.com
# pull
    sudo docker pull registry.cn-hangzhou.aliyuncs.com/x_y/mysql:[镜像版本号]
# push
    sudo docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/x_y/mysql:[镜像版本号]
    sudo docker push registry.cn-hangzhou.aliyuncs.com/x_y/mysql:[镜像版本号]
# 镜像加速
    sudo mkdir -p /etc/docker
    sudo tee /etc/docker/daemon.json <<-'EOF'
    {
    "registry-mirrors": ["https://gle3e6xb.mirror.aliyuncs.com"]
    }
    EOF
    sudo systemctl daemon-reload
    sudo systemctl restart docker