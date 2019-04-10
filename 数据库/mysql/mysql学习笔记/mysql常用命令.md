## 更改密码
- sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
- 在[mysqld]下添加一行 skip-grant-tables
- 重启mysql

        sudo service mysql restart
- 登录mysql，不需要输入密码

        mysql -uroot -p
- 修改密码

        use mysql;
        5.7以下
        update user set password=password('123') 
        where user='root'; 
        5.7以上
        update user set authentication_string=password('123') 
        where user='root'; 
        flush privileges;
- 查看表的结构

        desc 表名
- 查询结构格式输出

        在查询语句后加 \G
- 解决ubuntu18登录mysql必须加sudo的问题

      update mysql.user set authentication_string=PASSWORD('mysql'), plugin='mysql_native_password' where user='root';

- 查看变量信息

        show variables like '变量名';