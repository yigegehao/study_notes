# HTML规范
    1.HTML不区分大小写
    2.结构：声明部分，head部分，body部分

# 声明部分
    <!DOCTYPE html>
# head部分
    可以配置字符集、关键字、页面描述、页面标题
    <title>:网页的标题
    <base>:默认地址
    <meta>:页面基本信息
    <link>:定义文档与外部资源的关系
    <meta http-equiv="refresh" content="3;http://www.baidu.com">
    上面这个标签的意思是说，3秒之后，自动跳转到百度页面。
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">：定义浏览器解析网页时的解码方式
# body部分
    属性：bgcolor,background,text,leftmargin,topmargin,rightmargin,bottommargin

# 排版标签
    <!--注释-->
    <p>段落</p>
    文本级标签：
    p,span,a,b,i,u,em
    容器级标签：
    div,h,li,dt,dd
# 特殊字符
字符|含义
-|-
 &nbsp|空格 |
 &lt| 小于号 |
 &gt| 大于号 |
 &amp| 符号& |
 &quot| 双引号 |
 &apos| 单引号 |
 &copy| 版权 |
 &trade| 商标 |
# 列表标签
    <ul>
        <li></li>
    </ul>
    ,<OL>
        <li></li>
     </OL>
     ,<dl>
        <dt></dt>
        <dd></dd>
      </dl>
# 框架
    <frameset>:可以包含frameset和frame
    <frame>:
    <iframe>:可以嵌套在<body>标签中
# 