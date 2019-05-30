#!/bin/bash
S=$1
E=$2

for i  in $(seq $S $E)
do
  page=$i
  curl -X GET "http://218.67.246.61/jzz/mdgslist.jsp?colid=5&strCon=null&page=$page" | iconv -f gbk -t utf8 | grep "jzzzl_box_main_font_02" >> data.txt
done
