## jsp语法

- 脚本程序
可以包含任意量的java语句，变量，方法或表达式  

        语法格式
        <% 代码块 %>
        等价于
        <jsp:scriptlet>
        代码块
        </jsp:scriptlet>

- 任何文本，html标签，jsp元素必须写在脚本程序的外面

- jsp声明:一个声明语句可以声明一个或多个变量，方法，供后面的java代码使用  

        语法格式:
        <%! 声明部分 %>
        等价于
        <jsp:declaration>
        声明部分
        </jsp:declaration>

- jsp表达式  

        语法格式
        <%= 表达式 %>
        等价于
        <jsp:expression>
        表达式
        </jsp:expression>

- jsp注释  

        <%--  --%>

- jsp指令  

        用来设置与整个jsp页面相关的属性  
        语法格式 <%@ directive attribute="value" %>  
        三种指令标签  
        <%@ page...%> 指定页面的依赖属性，比如脚本语言，error页面，缓存需求  
        <%@ include...%>
        包含其它文件  
        <%@ tablib...%>
        引入标签库的定义，可以是自定义标签库

- jsp行为  
使用xml语法结构来控制servlet引擎。  
能动态插入一个文件  
重用JavaBean组件  
引导用户去另一个页面  
为Java插件产生相关的html

        语法格式
        <jsp:action_name attribute="value"/>
        jsp:include 	用于在当前页面中包含静态或动态资源
        jsp:useBean 	寻找和初始化一个JavaBean组件
        jsp:setProperty 设置JavaBean组件的值
        jsp:getProperty 将JavaBean的值插入到output中
        jsp:forward 	从一个jsp文件向另一个文件传递一个包含用户请求的request对象
        jsp:plugin 	用于在生成的Html页面中包含Applet和JavaBean对象
        jsp:element     动态创建一个xml元素
        jsp:attribute   定义动态创建的xml元素的属性
        jsp:body 	  定义动态创建的xml元素的主体
        jsp:text 	  用于封装模板数据
- 所有动作要素都有两个属性

        id 唯一标识，可通过PageContext来调用
        scope 识别动作元素的生命周期


- jsp隐藏对象


        request       HttpServletRequest类的实例
        response 	HttpServletResponse类的实例
        out 		PrintWrite类的实例
        session 	httpSession类的实例
        application   ServletContext类的实例
        config 	ServletConfig类的实例
        pageContext   PageContext类的实例，提供对jsp页面所有对象以及命名空间的访问
        page 		类似于java类中的this关键字
        Exception 	Exception类的对象，代表发生错误的jsp页面中对应的异常对象







