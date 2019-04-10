## 什么是SpringMVC

    SpringMVC是一个集成在Spring中的MVC框架

## springmvc框架原理
---前端控制器  
---处理器映射器  
---处理器适配器  
---视图解析器

--springmvc运行步骤  
1. 发起请求 -> 前端控制器(DispatcherServlet）  
2. 前端控制(DispatcherServlet)请求HandlerMapping查找Handler(xml配置or注解)  
3. 处理器映射器(HandlerMapping)向前端控制器返回Handler  
4. 前端控制器(DisPatcherServlet)调用处理适配器执行Handler 
5. 处理器适配器执行Handler  
6. Handler执行完成返回ModelAndView给处理器适配器  
7. 处理器适配器向前端控制器返回ModelAndView  
8. 前端控制器请求视图解析器进行视图解析  
9. 视图解析器向前端控制器返回View  
10. 前端控制器进行视图渲染(将数据模型填充到request中)  
11. 前端控制器向用户响应结果

--组件
1. 前端控制器DispatcherServlet(不需要程序员开发)
作用:接收请求,响应结果,相当于转发器,中央处理器
有了DispatcherServlet减少了其它组件之间的耦合的
2. 处理器映射器 HandlerMapping(不需要程序员开发)
作用:根据请求的url查找Handler
3. 处理器适配器 HandlerAdapter
作用:按照特定规则去执行Handler
注意:编写Handler时按照HandlerAdapter的要求去做
4. 视图解析器 View resolver
作用:进行视图解析,根据逻辑视图名解析成正真的视图
5. 视图View
View是一个接口,实现类支持不同的View(jsp,freemark,pdf...)