#!/bin/bash
#获取占用指定端口程序的PID
name=`lsof -i:"${1}" | awk '{print $2}' | sed -n "2, 1p"`
if [ -z ${name} ];then
    echo "${1}此端口没有占用"
else
    kill -9 ${name}
    echo "${1}端口已关闭"
fi
