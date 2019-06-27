# 为什么学习注解

    1.能过读懂代码
    2.让编程更简洁，代码更清晰

# 注解的定义

    Java提供的一种源程序中元素关联任何信息和任何元数据的途径和方法。
    从jdk1.5出现

# JDK中常见的自带注解

    @Override：重写
    @Deprecated：使方法过时
    @SupviceWarnings：消除警告

# 注解的分类

    1.按运行机制分类
    源码注解：只在源码中存在，class文件中不存在
    编译时注解：源码与class文件中都有
    运行时注解：运行时起作用
    2.按来源来分类
    来自jdk的注解
    来自第三方的注解
    自定义注解
    3.元注解

# 自定义注解的的语法要求

    1.使用@interface关键字定义注解
    2.成员以无参无异常方式声明
    3.可以用default给成员指定一个默认的值
    4.成员的类型受限制
    5.如果只有一个成员，成员名必须取名为value()
    6.没有成员的注解叫标志注解
    例如：
    //元注解
    @Target({ElementType.METHOD,ElementType.ANNOTATION_TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @Inherited
    @Documented
    //元注解
    public @interface Description{
        String desc();
        String author();
        int age() default 18;
    }

# 注解解析

    通过反射获取类、函数、或成员上的运行时注解信息，从而实现动态控制程序运行逻辑。