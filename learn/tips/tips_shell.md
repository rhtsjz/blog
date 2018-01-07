## imageGen.sh
```bash
#!/bin/bash
input=$1
domain="abc"
for i in $(seq $2 $3)
do
  var=$(awk NR==$i $input)
  index=$(echo $var | awk '{print $1}')
  path=$(echo $var | awk '{print $2}')
  url="$domain""$path"
  echo "var: ""$var"
  echo "url: ""$url"
  echo "index: ""$index"
  if [ $[$index%8] == 0 ]; then
    echo "sleeping... "
    sh sleep.sh
  fi
  sh ff_cmd.sh $url $index > /dev/null 2>&1 &
done
```

## sleep.sh
```bash
#!/bin/bash
sleep 30
```

## ff_cmd.sh
```bash
#!/bin/bash
url=$1
index=$2
echo "$url""$index"
ffmpeg -i "$url" -r 1/60 images/"$index"_img%04d.jpg
#ffmpeg -i "$url" images/"$index"_img%04d.jpg
```

## ddd.txt
```
1	/jz5aeeb07755ee4362837d2b0b984c33ed/streams/vipkid_jz107689008e5d45168d73914a7141789e_f_1511612893706_t_1511614529286.mp4
```