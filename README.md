# 企业展示型小程序
该项目采用前后端分离的架构模式，主要包括3部分：

1、用户端：即小程序，UI组件使用的`Vant Weapp`

请移步：https://github.com/chudaozhe/enterprise-weapp

2、管理员端：Vue + Element UI

请移步：https://github.com/chudaozhe/enterprise-admin

3、服务端：GO + Mysql + Nginx + Redis

请移步：https://github.com/chudaozhe/enterprise-api

## 在线体验
```
https://ent.cuiwei.net/console/
用户名：admin
密码：123456
```

## 快速开始
1、启动服务
```
docker-compose up -d
```

2、连接mysql并导入`doc/all.sql`
```
ip: localhost
用户名：root
密码为空
```

3、把管理员端的代码复制到`www/ent/web`目录

> 注意是执行`npm run build`后得到的代码

默认无需操作

4、访问测试接口，如果能打开说明服务正常

[打开测试](http://localhost/v1/user/test)

5、配置用户端，即小程序端的接口前缀

默认无需操作

6、打开管理后台

[打开登陆](http://localhost/console/)

```
用户名：admin
密码：123456
```

## 常见问题
### 如何配置域名？
该项目默认通过`localhost`访问，你也可以修改为自己的域名

1、在服务端 修改对应的配置文件，比如要修改test环境
```
vi app/config/app-test.json

把里面的 app_host 字段修改为你的域名
```

2、修改nginx配置文件
```
vi etc/nginx/local.conf

把里面的 server_name 字段修改为你的域名
```

## 截图

### 管理员端
![11.jpg](https://ent.cuiwei.net/screenshots/admin/11.jpg)
![22.jpg](https://ent.cuiwei.net/screenshots/admin/22.jpg)
![33.jpg](https://ent.cuiwei.net/screenshots/admin/33.jpg)

### 用户端

![home.jpg](https://ent.cuiwei.net/screenshots/user/home.jpg)
![cases.jpg](https://ent.cuiwei.net/screenshots/user/cases.jpg)
![news.jpg](https://ent.cuiwei.net/screenshots/user/news.jpg)

