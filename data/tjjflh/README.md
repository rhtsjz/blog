# 天津2018第一期积分落户公示名单
1. 数据获取和数据清洗
```bash
// 数据获取 得到 data.txt
sh get.sh 1 157
// 去除^M
sed -i 's/^M//g' data.txt
// 切割出姓名身份证号码和分数并去除空行 得到 data1.txt
cat data.txt | awk -F '02">|</td' '{print $2}' | grep -v "font" | grep -v ^$  > data1.txt
// 整理数据每个人的数据放到同一行 得到 data2.txt
cat data1.txt | awk '{if(NR%3!=0)ORS=" ";else ORS="\n"}1' > data2.txt

```

2. 人数top10城市

```bash
cat data2.txt | awk '{print substr($2, 1, 4)}' | sort | uniq -c | sort -nr | head
```

人数 | 城市代码 | 省份
--- | --- | ---
324 | 1309 | 河北沧州
318 | 3714 | 山东德州
172 | 1302 | 河北唐山
147 | 3729 | 山东菏泽
144 | 1306 | 河北保定
136 | 1311 | 河北衡水
126 | 3724 | 山东德州
122 | 1304 | 河北邯郸
120 | 1301 | 河北石家庄
95  | 2302 | 黑龙江齐齐哈尔

2. 性别

```bash
cat data2.txt | awk '{print substr($2, 18, 1)}' | awk '{print $1%2}' | sort | uniq -c | sort -nr
```

人数 | 性别
--- | --- 
2865 | 男 
1829 | 女 



参考 [https://www.cnblogs.com/chenjiahe/p/6164673.html](https://www.cnblogs.com/chenjiahe/p/6164673.html)
