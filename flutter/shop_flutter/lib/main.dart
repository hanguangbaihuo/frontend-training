/*
 * @Author: 明华
 * @Date: 2021-01-08 10:20:36
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 17:36:15
 * @Description: 
 * @FilePath: /shop_flutter/lib/main.dart
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:shop_flutter/router/routers.dart';
import 'package:shop_flutter/router/application.dart';
import 'package:shop_flutter/provider/user_info.dart';
import 'package:provider/provider.dart';

// 入口程序
void main() {
  runApp(ShopApp());
}

// 根组件
class ShopApp extends StatelessWidget {
  ShopApp() {
    // 定义路由
    final router = FluroRouter();
    // 配置路由
    Routers.configureRoutes(router);
    // 指定路由至 Application 对象，便于调用
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // 管理多个共享数据类型
    return MultiProvider(
      providers: [
        // 用户信息
        Provider(
          create: (_) => UserInfoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // 生成路由回调函数，当导航的命名路由的时候，会使用这个来生成界面
        onGenerateRoute: Application.router.generator,
        // 定义主题
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      ),
    );
  }
}
