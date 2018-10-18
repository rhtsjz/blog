#北京2018年积分落户公示名单
##数据获取
1. 获取方式 `sh get.sh 0 602 > t.txt` 参数为开始页码和结束页码
下载起来很快,1分钟左右
##数据清洗
1. 下载的原始数据位于文件 `t.txt` 中,但是有个问题文件中的中文乱码,看来是编码的问题了,网站的编码是GBK,  
通过chrome的开发者工具看了下,果然是这样,响应头中有这么一项 `Content-Type: application/json;charset=GBK`  
使用idea打开选择编码为`GBK`出现了汉字,然后手动复制到文件 `t1.txt` 中,至此数据就可以使用了
2. 文件 `t1.txt` 中每行是一页的数据,需要做进一步的处理,最好是每行一个人的数据,
使用 `sed` 对文件 `t1.txt` 进行切割与替换之后得到 `t2.txt` ,这样得到了每个人一行
3. 再从 `t2.txt` 中提取数据,
从身份证号 `idCard` 中
提取省份得到文件 `province.txt` ,
提取出生年得到文件 `birth_year.txt`
从 `score`(一行中有两个 `score` ,此处使用的是行尾的) 中提取分数得到文件 `score.txt`
从 `unit` 中提取公司得到文件 `unit.txt`
##数据展示
1. 在 `http://jsfiddle.net/` 将年龄和分数做了饼图这样看起来更直观一些
[年龄](http://jsfiddle.net/rhtsjz/3dLxq6ye/show)
[分数](http://jsfiddle.net/rhtsjz/vn41y35j/show)