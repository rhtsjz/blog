### 在 CentOS 下 SSH 通过公钥进行无密码登录失败  
原因  
- 新创建的
``` ~/.ssh/authorized_keys ```
权限过高  

参考  
- [Why am I still getting a password prompt with ssh with public key authentication? - Unix & Linux Stack Exchange](http://unix.stackexchange.com/questions/36540/why-am-i-still-getting-a-password-prompt-with-ssh-with-public-key-authentication)  
- [ssh public keys fail if authorized_keys has incorrect permissions » Paul Gross's Blog](https://www.pgrs.net/2007/09/21/ssh-public-keys-fail-if-authorized_keys-has-incorrect-permissions/)  
- [Adding public key to ~/.ssh/authorized_keys does not log me in automatically - Stack Overflow](http://stackoverflow.com/questions/6377009/adding-public-key-to-ssh-authorized-keys-does-not-log-me-in-automatically)  
- [OpenSSH FAQ](http://www.openssh.com/faq.html#3.14)  

总结
- 以后机器之间拷贝 ssh 密钥不要再通过手工的拷贝，而是通过 ssh 提供的工具命令
``` ssh-copy-id ```
进行拷贝
