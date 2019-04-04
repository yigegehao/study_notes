# linux上MySQL5.6设置编码

    ---查看编码---
    show variables like 'character%'
    
    1.vim /etc/mysql/my.cnf
    2.添加以下内容
    [client]
    default-character-set=utf8

    [mysqld]
    character-set-server=utf8

    [mysql]
    default-character-set=utf8