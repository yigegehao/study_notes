
    //拉取mysql镜像
    docker pull mysql:5.6
    //查看mysql镜像
    docker images
    //启动mysql镜像
    docker run -itd -P mysql:5.6 bash
    docker run -p 3306:3306 --name mymysql -e MYSQL_ROOT_PASSWORD=x -d mysql:5.6
    //查看已经运行的docker镜像
    docker ps -a
    //连接到docker镜像
    docker exec -it 正在运行中的镜像名(name) bash
    //启动mysql
    service mysql start
    //更改mysql密码
    update user set authentication_string=password('x') where user = 'root'
    flush privileges;
    //授权
     GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'x' WITH GRANT OPTION;
    