# 简介

    CSS是层叠样式表的英文简称（Cascading Style Sheets），用来定义HTML元素的样式。

# CSS实例

    一个CSS实例由两个主要的部分构成:
    1.选择器：HTML元素
    2.一条或多条声明：声明整体用大括号括起，每条声明由属性和值组成，多条声明之间用分号分隔。

# CSS注释

    /*注释*/

# CSS盒子模型
![](./picture/boxModel.png)

# CSS3
## 边框
    border-radius:圆角
    box-shadow:阴影
    border-image:边界样式
## 背景
    background-image
    background-size
    background-origin
    background-clip
## 渐变
    background:linear-gradient([to 位置],color1 [%],color2 [%],color...)
    background:repeating-linear-gradient:重复渐变
    background:radial-gradient:径向渐变
## 文本效果
    text-overflow:处理溢出的文本
## 字体
    导入字体
    @font-face{
        font-family:myFont;
        src:url();
    }
    div{
        font-family:myFont;
    }
    加粗
    font-weight:bold
# 2D转换
    //旋转30度
    transform:rotate(30deg)
    //移动
    transform:translate(,)
    //增大或缩小元素的大小
    transform:scale
# 过渡
    //当width发生变化时,变化过程为两秒
    transition:width 2s
# 动画
    设置动画
    @keyframes myfirst{

    }
    使用动画
    div{
        animation:myfirst 5s;
    }
## 多列
    column-count
    column-gap
    column-rule-style
    column-rule-width
    column-rule-color
    column-rule
    column-span
    column-width
## 界面
    //自定义适应
    box-sizing:border-box;
    resize：
## 响应式图片
    max-width: 100%;
    height: auto;
## 卡片式图片
## 滤镜
    filter:
##弹性盒子
    设置弹性盒子
    display:flex
    设置布局
    flex-direction:colum|colum-reverse|row|row-reverse
    内容对齐
    justify-content: