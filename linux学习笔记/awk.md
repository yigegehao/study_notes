# awk模式
    awk '条件类型1{动作1} 条件类型1{动作2} ...' filename
# 去重
awk '!a[$0]++' 