# ubuntu18安装docker

        sudo apt install docker.io
        sudo systemctl start docker
        sudo systemctl enable docker
        #免sudo配置
        sudo groupadd docker
        sudo gpasswd -a ${USER} docker
        sudo service docker restart
        newgrp - docker
