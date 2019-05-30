## 配合使用 ```proxy_intercept_errors``` 和 ```error_page``` 指令实现无跳转自定义页错误(response code > 300)页面  
具体的配置  
```nginx
server {
        ## 其他配置
        proxy_intercept_errors on;
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /var/www/dev-new;
        }
}

```
参考链接  
[http://blog.csdn.net/hellolingyun/article/details/37934815](http://blog.csdn.net/hellolingyun/article/details/37934815)  
[http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_intercept_errors](http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_intercept_errors)  
[http://nginx.org/en/docs/http/ngx_http_core_module.html#error_page](http://nginx.org/en/docs/http/ngx_http_core_module.html#error_page)
