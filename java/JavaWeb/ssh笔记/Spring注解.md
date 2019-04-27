# 常用的Spring注解
## 创建对象

    @Component:作用相当于xml中的bean
    @Controller:一般用于表现层对象(action对象)
    @Service:一般用于业务层对象(service对象)
    @Repository:一般用于持久层对象(dao对象)
    @Scope:bean的作用范围(singleton,prototype,request,session,globalsession)

## 注入数据

    @Autowired:
    作用：根据bean的类型自动注入
    细节：如果spring容器中同一个类型有多个bean存在，则需要根据变量名称和bean的id进行比较。如果有相同则能注入成功；否则注入失败

    @Qualifier
    作用:在注入数据时，可以配合@Autowired注解一起使用。在按照类型注入的基础上，按照bean的id注入。
    属性:value：指定注入bean的id
    细节:1.在给类的成员变量注入数据时，不能单独使用，需要配合@Autowired注解一起使用
         2.在给方法的形参注入数据时候，可以单独使用

    @Resource
    作用：按照bean的id注入数据。
    属性：name：指定注入bean的id
        type：指定注入bean的类型
    细节：默认情况下（不指定属性），它会先根据变量名称注入，注入不成功；再根据类型注入。

    @Value
    作用：给基本类型和String类型注入数据。
    属性：value：注入的数据值

## 和生命周期相关的注解

    @PostConstruct
    作用：指定在spring容器创建对象时（构造方法执行后立即执行），调用的方法。该方法一般都是执行一些初始化的操作。
    细节：相当于xml配置中bean标签的init-method属性

    @PreDestory
    作用：指定在spring容器销毁前，调用的方法。该方法一般都是执行一些释放资源的操作。
    细节：相当于xml配置中bean标签的destroy-method属性

# Hibernae注解

    @Entity
    作用：声明该类是一个JPA标准的实体类

    @Table
    作用：指定实体类关联的表，注意如果不写表名，默认使用类名对应表名。
    属性：name 指明数据库的表

    @Column  
    作用：指定实体类属性对应的表字段，如果属性和字段一致，可以不写
    属性：name 指明数据库对应的字段名

    Id生成策略
    @Id
    作用：声明属性是一个OID，对应的一定是数据库的主键字段
    @GenerateValue 
    作用：声明OID的主键策略
    @SequenceGenerate
    作用：使用SEQUENCE策略时，用于设置策略的参数

    @TableGenerate
    作用：使用TABLE主键策略时，用于设置策略的参数

    @JoinTable
    作用：关联查询时，表与表是多对多的关系时，指定多对多关联表中间表的参数

    @JoinColumn  
    作用：关联查询时，表与表是一对一、一对多、多对一以及多对多的关系时，声明表关联的外键字段作为连接表的条件。必须配合关联表的注解一起使用

    @OneToMany
    作用：关联表注解，表示对应的实体和本类是一对多的关系

    @ManyToOne
    作用：关联表注解，表示对应的实体和本类是多对一的关系

    @ManyToMany
    作用：关联表注解，表示对应的实体和本类是多对多的关系

# Struts2注解

    @NameSpace
    出现的位置：它只能出现在 package 上或者 Action 类上。一般情况下都是写在 Action 类上。
    作用：指定当前 Action 中所有动作方法的名称空间。
    属性：value ：指定名称空间的名称。写法和 xml 配置时一致。不指定的话，默认名称空间是""。


    @ParentPackage
    出现的位置：它只能出现在 package 上或者 Action 类上。一般情况下都是写在 Action 类上。
    作用：指定当前动作类所在包的父包。(eg:"struts-default")
    value ：指定父包的名称

    @Action
    出现的位置：它只能出现在 Action 类上或者动作方法上。一般情况下都是写在动作方法上。
    作用：指定当前动作方法的动作名称。也就是 xml 配置时 action 标签的 name 属性。
    属性：
    value ：指定动作名称。
    results[]： ：它是一个数组，数据类型是注解。用于指定结果视图。此属性可以没有，当没有
    该属性时，表示不返回任何结果视图。即使用 response 输出响应正文。
    interceptorRefs[] ：它是一个数组，数据类型是注解。用于指定引用的拦截器。

    @Result
    出现的位置：它可以出现在动作类上，也可以出现在 Action 注解中。
    作用：出现在类上，表示当前动作类中的所有动作方法都可以用此视图。
    出现在 Action 注解中，表示当前 Action 可用此视图。
    属性：
    name ：指定逻辑结果视图名称。
    type  ：指定前往视图的方式。例如：请求转发，重定向，重定向到另外的动作。
    location ：指定前往的地址。可以是一个页面，也可以是一个动作。

    @Results
    出现的位置：它可以出现在动作类上，也可以出现在 Action 注解中。
    作用：用于配置多个结果视图。
    属性：
    value ：它是一个数组，数据类型是 result 注解。

    @InterceptorRef
    出现的位置：它可以出现在动作类上或者 Action 注解中。
    作用：用于配置要引用的拦截器或者拦截器栈
    属性：
    value ：用于指定拦截器或者拦截器栈
