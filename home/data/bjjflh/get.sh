#!/bin/bash
S=$1
E=$2

for i  in $(seq $S $E)
do
  page=$(($i*10))
  #echo $page
  curl -X GET "http://www.bjrbj.gov.cn/integralpublic/settlePerson/settlePersonJson?sort=pxid&order=asc&limit=10&offset=$page&name=&rows=10&page=$page&_=1539750526453"
  echo "\n"
done
