'''
合并两个有序线性表,保留相同值,并保持有序:
算法:
将两个线性表的数据分别保存在listA,listB
将listB中的数据合并到listA中
让listA和listB从头开始比较,如果listB中的元素符合条件,插入到listA中游标停止的位置
然后listA和listB的游标++,否则只移动listA的游标
比较到最后,如果listB游标的值=listB的长度,说明listB中元素以全部插入到listA中
如果不等,则需要将listB游标后的元素都插入到listB中
'''

def union(listA,listB):
    sizeB = len(listB)
    i = 0;
    j = 0;
    while i<len(listA):
        if j == sizeB: #listB遍历完
            break
        if listA[i] >= listB[j]:
            listA.insert(i,listB[j])
            j = j + 1
        i = i + 1
    if j != sizeB:
        listA = listA + listB[j:]
    print(listA)

stringA = input("请输入一串递增的数字,以,分隔\n").split(',')
stringB = input("请输入另一串递增的数字,以,分隔\n").split(',')
listA = list(map(int,stringA))
listB = list(map(int,stringB))

union(listA,listB)
    