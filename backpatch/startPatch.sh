#!/bin/bash
echo "开始备份------------------"
./backPatch.sh $1 &> log.txt
mv log.txt $1_back/

echo "备份成功------------------"
echo "已存入$1_back文件中,备份信息存在该文件夹的log.txt文件中"
