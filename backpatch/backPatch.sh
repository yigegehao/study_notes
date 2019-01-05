#!/bin/bash
 
function readfile ()
{
#这里`为esc下面的按键符号
 for file in `ls $1`
 do
#这里的-d表示是一个directory，即目录/子文件夹
 if [ -d $1"/"$file ]
 then
#如果子文件夹则递归
  readfile $1"/"$file
 else
#否则就能够读取该文件的地址
  echo $1"/"$file
#读取该文件的文件名，basename是提取文件名的关键字
 #echo `basename $file`
 fi
 done
}
#函数定义结束，这里用来运行函数
mkdir $1_back
temp=$(readfile $1) #> temp
#ekp项目所在的路径
ekpPath=`cat ./ekpPath.txt`
echo $ekpPath
#echo "开始备份----------------"
cd ..
for line in $temp
do
    bpath=`python $ekpPath/backpatch/path.py $line`
    echo $bpath
    `cp -p --parent $bpath $ekpPath/backpatch/$1_back`
done

#echo "备份完成----------------"
#echo "已存入$1_back文件中,备份信息存在该文件夹的log.txt文件中"
#echo ${temp}
