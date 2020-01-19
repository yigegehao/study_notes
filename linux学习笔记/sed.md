# 删除2-5行
    sed '2,5d'
# 在第二行新增内容
    sed '2i 内容'
# 在第二行后新增内容
    sed '2a 内容'
# 替换2-5行的内容
    sed '2,5 内容'
# 列出2-5行的内容
    sed -n '2,5p'
# 查找和替换内容
    sed 's/内容/替换字符/g'
# 查找替换行内容
    sed -i "s/^.*VUE_APP_VER.*$/VUE_APP_VER=`date "+%m%d-%H"`/g" .env
# 删除空白行
    sed '/^$/d'
# 文件尾添加内容
    sed -i '$a 内容' file