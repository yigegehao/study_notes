# jsp八大内置对象
1. request:对当前请求进行封装；
2. response:服务器对用户端请求的响应
3. pageContext:只对当前页有效，里面封装了基本的request和session对象
4. Session：浏览器会话对象，浏览器范围类有效
5. application:对整个web工程有效
6. out：页面打印对象
7. config：单个servlet的配置对象
8. page：网页本身
9. exception：针对错误网页

# jsp的六大动作
include:在页面被请求的时候引入一个文件
useBean:寻找或者实例化一个javabean
setProperty:设置javabean的属性
getProperty:输出某个javabean的属性
forward:把请求转到一个新的页面
plugin:根据浏览器类型为java插件生成OBJECT或EMBED标记

