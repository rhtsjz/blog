##Thu Apr 21 2016 11:25:14 GMT+0800 (China Standard Time)##
###[Does EL support overloaded methods?](http://stackoverflow.com/questions/9763619/does-el-support-overloaded-methods/10326655)###
###[EL ( JSP 表达式语言) 是否支持方法重载?](http://stackoverflow.com/questions/9763619/does-el-support-overloaded-methods/10326655)###
###[Answers](http://stackoverflow.com/questions/9763619/does-el-support-overloaded-methods/10326655#10326655)###
###[回答](http://stackoverflow.com/questions/9763619/does-el-support-overloaded-methods/10326655#10326655)###
EL does not support it, no. It'll always be the first method of the 
[Class#getMethods()](http://docs.oracle.com/javase/6/docs/api/java/lang/Class.html#getMethods%28%29) 
array whose name (and amount of arguments) matches the EL method call. 
Whether it returns the same method everytime or not depends on the JVM make/version used. 
Perhaps you made a Java SE upgrade in the meanwhile as well. The javadoc even says this:  
> The elements in the array returned are not sorted and are not in any particular order.

You should not rely on unspecified behaviour. Give them a different name.  

EL不支持方法重载。 被调用的方法总是由[Class#getMethods()](http://docs.oracle.com/javase/6/docs/api/java/lang/Class.html#getMethods%28%29)  返回的方法数组中符合方法名（和参数数量）的方法的第一个被调用。
而是否返回相同的方法依赖于JVM 使用的版本。也许你这个时候对 Java SE 进行了升级。文档中是这样描述的：  
> 返回的数组中的元素并没有排序他们也没有什么特定的顺序。

你不应该依赖没有指明的行为。将他们命名为不同的名字吧少年。
