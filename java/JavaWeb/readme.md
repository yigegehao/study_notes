## 软件开发的三个方向
- 桌面应用程序
- web应用程序
- 嵌入式应用程序

## 静态网页
表现形式：网页内容是固定的，不会更新
所需技术：HTML+CSS

## 动态网页
表现形式：网页中的内容通过程序动态显示，自动更新。
所需技术：HTML+CSS+数据库技术+至少一门高级语言+其它

## 搭建JavaWeb开发环境
JDK+Tomcat+eclipse

### Tomcat目录结构
- /bin 存放tomcat的一些脚本，包括启动和停止的脚本
- /conf 存放各种配置文件
- /lib 存放tomcat需要的各种jar包
- /logs 存放日志文件
- /temp 存放tomcat运行时的临时文件
- /webapps 存放发布的web应用，只需将war包放到此目录下，启动服务器会自动解压
- /work 存放有jsp转换成的class和java文件

## Web项目的目录结构
       |-web项目名
        |-WEB-INF
        |    -classes(class文件)
        |    -lib(jar包)
        |    -web.xml(web应用配置文件)
        |-资源文件(HTML,CSS,JSP等)
    访问方式：http|htts://域名|IP:端口/Web项目名/资源文件位置
    WEB-INF存放的资源文件无法通过URL访问
    
