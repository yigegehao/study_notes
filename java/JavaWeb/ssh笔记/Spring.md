
# SpringAOP
## 什么是AOP
    AOP是面向切面编程,通过预编译方式和运行期动态代理实现程序功能的统一维护的一种技术。
## AOP相关术语介绍
![](./picture/aop_relate_intro.png)

## AOP底层实现
    JDK代理:代理对象必须有实现接口
    CGlib代理:代理对象有继承父类
    AspectJ:预编译时实现代理

## AspectJ
![](./picture/aspectj通知及注解.png)
### 切入点表达式
![](./picture/切入点表达式.png)
### 切点命名
![](./picture/切点命名.png)