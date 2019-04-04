# 什么是ORM
对象关系映射，是一种为解决程序的面向对象模型与数据库的关系模型互不匹配问题的技术。
ORM通过使用描述对象和数据库之间映射的元数据，将程序中的对象自动持久化到关系数据库中，或者将关系数据库表中的行转换成Java对象，其本质就是将数据从一种形式转换到另外一种形式。
# 常用的ORM框架
## Hibernate
Hibernate是一个持久层的ORM框架，使用Hibernate框架，不用写JDBC代码，仅仅是调用一个save方法，就可以将对象保存到关系数据库中；仅仅是调用一个get方法，就可以从数据库中加载出一个对象
### 使用流程
配置Configuration对象->产生SessionFactory->创建session对象->开启事务->完成CRUB操作->提交事务-> 关闭session
### 配置文件
先配置hibernate.cfg.xml文件，其中配置数据连接信息和方言等，还要 为每个实体配置相应的 hbm.xml 文件，然后在 hibernate.cfg.xml 文件中引入；
### 关联关系映射
一对多：

1. 一方：需要加入一个包含多方的set集合，注意必须要new
2. 多方：添加一方的bean对象，注意不用new
3. 注意：只配置一方即可正常维护运行。一般一方会放弃外键维护；多读多保存中，由乙方必须放弃维护中间表“inverse=true”

### 层级关系：cascade的6种取值
1. none：不使用级联
2. save-update：保存或修改
3. delete：删除
4. delete-orphan：孤儿删除（只有一对多才有）
5. all：除了孤儿，删除所有
6. all-delete-orphan：删除所有

### 延迟加载：
底层：动态代理技术

第一次查询时-》查询ID值，生成代理对象-》继续操作-》发送sql语句-》返回查询值

类级别的延迟加载：查询的是某一个对象
1. session.get() 不延迟加载
2. session.loade() 延迟加载

两者的区别，关联级别的延迟加载
1. fetch=“select" lazy="true"&nbsp;&nbsp;延迟加载(默认)
2. fetch="select" lazy="false"&nbsp;&nbsp;不延迟
3. fetch=”select“ lazy=”extra“&nbsp;&nbsp;极其延迟加载

### 缓存
#### 缓存的概念
缓存是内存中开辟的一块空间，用来保存数据，实质是：一些集合设计

一级缓存：Session

自带的，不能卸载。一定存在的，与Session生命周期一样长，自动开启，默认session独享

二级缓存

默认没有开启，只提供了相关策略，需第三方插件，常用EHCache

快照机制

持久态对象，在获取的时候会保存两份：一份在缓存区，一份在快照区；在事务提交之前，会自动对比缓存区和快照区的数据，如果不一致，会自动修改缓存和快照区数据

### MyBatis
MyBatis是一个优秀的持久层框架，它对使用jdbc操作数据库的过程进行封装，使开发者只需要关注SQL本身，而不需要花费精力去处理注册驱动，创建connection，创建statement，手动设置参数，结果集检索等jdbc复杂的过程代码
Mybatis通过xml或注解的方式将要执行的各种statement配置起来，并通过java对象和statement中的sql进行映射生成最终执行的sql语句，最后由mybatis框架执行sql并将结果映射成java对象并返回

mybatis配置文件

1. SqlMapConfig.xml,此文件作为mybatis的全局配置文件，配置了mybatis的运行环境等信息
2. Mapper.xml,此文件作为Mybatis的sql映射文件，文件中配置了操作数据库的sql语句，此文件需要在SqlMapConfig.xml中加载

通过mybatis环境等配置信息构造SqlSessionFactory，即会话工厂

通过会话工厂创建sqlSession，通过sqlsession会话借口对数据库进行增删改查操作

mybatis底层自定义了Executor执行器接口来具体操作数据库，Executor接口有两个实现，一个基本执行器、一个缓存执行器，sqlsession底层通过executor接口操作数据库

MappedStatement也是mybatis一个底层封装对象，它包装了mybatis配置信息及sql映射信息等。mapper.xml文件中一个select/insert/update/delete标签对应一个MappedStatement对象，标签的id即是Mappedstatement的id
1. MappedStatement对sql执行输入参数进行定义，包括HashMap、基本类型、pojo，Executor通过Mapped Statement在执行sql前将输入的java对象映射至sql中，输入参数映射就是jdbc编程中对preparedStatement设置参数
2. MappedStatement对sql执行输出结果进行定义，包括HashMap、基本类型、pojo，Executor通过Mapped Statement在执行sql后将输出结果映射至java对象中，输出结果映射过程相当于jdbc编程中对结果的解析处理过程




