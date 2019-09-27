#bin/bash
# 文件过滤拷贝
for last; do true; done

args=$*
echo $args
filterList=${args// /\\|}

files=`ls | grep -v ${filterList} | grep -v file-filter-copy.sh`
dest=$last

for file in $files;do
	cp -r `pwd`/$file $dest
done
