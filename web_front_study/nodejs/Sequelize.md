# 什么是Sequelize

    Sequelize是一个基于 promise 的 Node.js ORM,
    目前支持 Postgres, MySQL, SQLite 和 Microsoft SQL Server
    它具有强大的事务支持, 关联关系, 预读和延迟加载,读取复制等功能.

# 安装

    npm install --save sequelize
    # 选择对应的数据库驱动安装:
    $ npm install --save pg pg-hstore # Postgres
    $ npm install --save mysql2
    $ npm install --save mariadb
    $ npm install --save sqlite3
    $ npm install --save tedious # Microsoft SQL Server

# 建立连接

    const Sequelize = require('sequelize');

    //方法1:单独传递参数
    const sequelize = new Sequelize('database', 'username', 'password', {
    host: 'localhost',
    dialect: /* 'mysql' | 'mariadb' | 'postgres' | 'mssql' 之一 */
    });

    // 方法2: 传递连接 URI
    const sequelize = new Sequelize('postgres://user:pass@example.com:5432/dbname');

    测试连接：
    sequelize
    .authenticate()
    .then(() => {
        console.log('Connection has been established successfully.');
    })
    .catch(err => {
        console.error('Unable to connect to the database:', err);
    });

# 表建模
## 扩展 Sequelize.Model类

    const Model = Sequelize.Model;
    class User extends Model{}
    User.init({
        //属性
        firstName:{
            type:Sequelize.STRING,
            allowNull:false //默认为true
        },
        lastName:{
            type:Sequelize.STRING,
        }
    },{
        sequelize,
        modelName:'user'
    });
       
## 使用sequelize.define定义

    const User = sequelize.define('user',{
        // 属性
        firstName: {
            type: Sequelize.STRING,
            allowNull: false
        },
        lastName: {
            type: Sequelize.STRING
            // allowNull 默认为 true
        }
    }，{
        参数
    });
    tip：实际上sequelize.define调用了Model.init

# 模型与数据库同步

    // 注意:如果表已经存在,使用`force:true`将删除该表
    User.sync({ force: true }).then(() => {
    // 现在数据库中的 `users` 表对应于模型定义
    return User.create({
        firstName: 'John',
        lastName: 'Hancock'
    });
    });

