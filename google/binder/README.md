
#Binder和Service (Read The Fucking Source Code. Freelancer)

##Hal -> App
从linux驱动写到App调用getSystemService或getService
https://www.linaro.org/blog/adding-a-new-system-service-to-android-5-tips-and-how-to/ (国外一片文章)
http://blog.csdn.net/luoshengyang/article/details/6567257 (系列文章)
http://www.yuanhh.com/2015/11/22/binder-use/ (getService从上到下)
```Java
1. getSystemService


2. getService1
IBinder binder = ServiceManager.getService("MyService"); //获取名为"MyService"的服务
IMyService myService = new MyServiceProxy(binder); //创建MyServiceProxy对象
myService.sayHello("binder");

3. getService2
IHelloService helloService = IHelloService.Stub.asInterface(ServiceManager.getService("hello"));
int val = helloService.getVal();   

```


###主要涉及一下文件：
ko驱动  /system/bin即可

android.os.ServiceManager   
core.java.android.app.ContextImpl   
core.java.android.context.Context  
core.java.android.joffee   IJoffeeService.aidl JoffeeManager.java   

services.core.java.com.android.server.joffee.JoffeeService  
services.core.jni. com_android_server_joffeeService.cpp onload.cpp  

services.java.com.android.server.SystemServer  



##Service从上到下， Client从上到下 [link](http://blog.csdn.net/luoshengyang/article/details/6642463) [binder系列][binder_detail]
1. 获取Service Manager的Java远程接口的过程；  
2. HelloService接口的定义；
3. HelloService的启动过程；
4. Client获取HelloService的Java远程接口的过程；
5. Client通过HelloService的Java远程接口来使用HelloService提供的服务的过程。



##binder解析深入[link](http://blog.csdn.net/luoshengyang/article/details/6618363)
1. Service Manager是如何成为一个守护进程的？即Service Manager是如何告知Binder驱动程序它是Binder机制的上下文管理者。
2. Server和Client是如何获得Service Manager接口的？即defaultServiceManager接口是如何实现的。
3. Server是如何把自己的服务启动起来的？Service Manager在Server启动的过程中是如何为Server提供服务的？即IServiceManager::addService接口是如何实现的。
4  Service Manager是如何为Client提供服务的？即IServiceManager::getService接口是如何实现的。




##binder



#getSystemService

#getService

#binder  BpBinder BnBinder




link:
[binder_detail]: http://www.yuanhh.com/2015/10/31/binder-prepare/