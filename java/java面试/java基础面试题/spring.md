# 什么是spring
Spring是一款开源轻量级的业务层框架，是一个控制反转(IoC)和面向切面(AOP)的容器框架，可以整合其他的主流框架；
# 什么是IoC
控制反转，将原来用new创建对象的方式交给Spring容器创建，实现了解耦
依赖注入的三种方式：接口注入，构造器注入，Setter注入
# 什么是AOP
面向切面编程，是指在不改变代码逻辑的情况下，实现功能的增加
用于处理系统中分布于各个模块的横切关注点，例如事务管理，日志，缓存等等


# Spring中的BeanFactory和ApplicationContext有什么联系
Spring通过配置文件描述bean与bean之间的依赖关系，利用java的反射机制实现bean的实例化，并建立bean之间的依赖关系，在此基础上，spring的IoC容器还提供了bean实例缓存、生命周期管理、bean实例代理、事件发布等高级服务
BeanFactory是Spring框架最核心的借口，它提供了IoC容器的配置机制
ApplicationContext建立beanFactory之上，提供了更多面向应用功能，包括国际化和框架事务体系的支持
通常将BeanFactory称为IoC容器，而ApplicationContext称之为上下文，前者更倾向与spring本身，后者更倾向于开发者

# SpringMVC运行原理
1. 客户端请求提交到DispatcherServlet
2. DispatcherServlet控制器查询一个或多个HandlerMapping,找到处理请求的Controller
3. DispatcherServlet将请求提交到controller
4. Controller调用业务逻辑处理后，返回ModelAndView
5. DispatcherServlet查询一个或多个ViewResoler视图解析器，找到ModelAndView指定的视图
6. 视图负责将结果显示到客户端
# 使用Spring框架的好处

