'''
合并两个线性表,不保留相同值,不排序
'''

def union(listA,listB):
    for itemA in listA:
        if itemA not in listB:
            listB.append(itemA)
    print(listB)

listA = [1,2,3,4]
listB = [2,3,5,6]

union(listA,listB)
    