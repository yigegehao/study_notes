##mysql
```
docker run -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:5.6.35
CREATE DATABASE IF NOT EXISTS test default charset utf8 COLLATE utf8_general_ci;
```

##mongo
```
docker pull daocloud.io/library/mongo:latest
docker run -p 27017:27017 -d daocloud.io/library/mongo:latest
```