# Python简介
    
    python是由龟叔闲着无聊开发的一门解释型脚本语言
    
# 基本语法
# 输入与输出
    
    输入：name=input()
    输出：print()
    多行字符串：用'''内容'''表示
    格式化输出：
        ”%f/d/s/x" %(num,...)
        "{0}...".format(num,...)
    编码与解码
        “”.encode("utf-8")
        "".decode("utf-8")
# 数据类型
    
    list:[]
    tuple:[] 里面的元素不可变
    dict:{} 键值对，key不可变
    set：set([1,...])
# 运算
    
    and,or,not
    
# 条件判断

    if <条件判断1>:
        <执行1>
    elif <条件判断2>:
        <执行2>
    elif <条件判断3>:
        <执行3>
    else:
        <执行4>

# 函数
    
    def 函数名(参数列表...):
        函数体/pass
    