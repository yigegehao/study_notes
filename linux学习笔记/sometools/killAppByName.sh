#!/bin/bash
list=`ps -ef | grep ${1} | awk '{print $2}'`
echo $list
for i in ${list[@]};do
    kill -9 ${i}
    echo ${i}
done

echo "success"
