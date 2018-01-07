### Client Side: 
引入jQuery并且使用下面的代码
```javaScript
var url = "http://rhtsjz.sinaapp.com/?callback=?";
$.getJSON(url, function (data) {
    console.log(data);
});
```
代码在jsfiddle: [http://jsfiddle.net/rhtsjz/v94u6p4h/](http://jsfiddle.net/rhtsjz/v94u6p4h/)

### Server Side: 
```php
<?php

	$data = array( 'name' => 'God', 'age' => -1 );
	header('Content-Type: application/json');
	$callback = $_GET["callback"];
	if($callback){
    	echo $callback . '(' . json_encode($data) . ')';	
    }else{
    	echo '(' . json_encode($data) . ')';   
    }
?>
```
请求中如果有``` callback ```参数,就会在返回结果中把 json 数据放在括号内作为方法的参数, 并将 ``` callback ```的值作为方法名放在括号前面;这样对于客户端来说就相当于一次方法调用.
