# 三种创建CSS样式的方式
- 方式一：外部样式表

        <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        </head>
- 方式二：内部样式表

        <head>
            <style>
                hr {color:sienna;}
                p {margin-left:20px;}
                body {background-image:url("images/back40.gif");}
            </style>
        </head>
- 内联样式

        <p style="color:sienna;margin-left:20px">这是一个段落。</p>

# 三种样式的优先级

        Inline style > Internal style sheet >External style sheet > 浏览器默认样式
