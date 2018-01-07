### 限制ip访问频率

```
    # 下面的配置与 server 同级

    #定义一个名为allips的limit_req_zone用来存储session，大小是10M内存，
    #以$binary_remote_addr 为key,限制平均每分的请求为10个，
    #1M能存储16000个状态，rete的值必须为整数，
    #如果限制两秒钟一个请求，可以设置成30r/m
    limit_req_zone $binary_remote_addr zone=allips:10m rate=10r/m;


    # 下面的配置在 server 中
        location /tuijian.do {
                # 下面的配置与 (location /) 完全相同
                default_type 'text/plain';
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP  $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                # (location /) 配置结束

                # 如果超出上面设置的频率 可以有30个请求排队处理，再超出的将被丢弃直接返回 503
                limit_req zone=allips burst=30 nodelay;
        }

```
参考资料  
[https://www.nginx.com/resources/admin-guide/restricting-access/](https://www.nginx.com/resources/admin-guide/restricting-access/)  
[http://nginx.org/en/docs/http/ngx_http_limit_req_module.html](http://nginx.org/en/docs/http/ngx_http_limit_req_module.html)  
[http://tengine.taobao.org/document_cn/http_limit_req_cn.html](http://tengine.taobao.org/document_cn/http_limit_req_cn.html)
