/*
 * @Author: 明华
 * @Date: 2021-01-08 10:20:36
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 06:58:00
 * @Description: 
 * @FilePath: /frontend-training/flutter/shop_flutter/lib/main.dart
 */

// import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
// import 'package:shop_flutter/router/routers.dart';
// import 'package:shop_flutter/router/application.dart';
// import 'package:shop_flutter/provider/user_info.dart';
// import 'package:provider/provider.dart';

// // 入口程序
// void main() {
//   runApp(ShopApp());
// }

// // 根组件
// class ShopApp extends StatelessWidget {
//   ShopApp() {
//     // 定义路由
//     final router = FluroRouter();
//     // 配置路由
//     Routers.configureRoutes(router);
//     // 指定路由至 Application 对象，便于调用
//     Application.router = router;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 管理多个共享数据类型
//     return MultiProvider(
//       providers: [
//         // 用户信息
//         Provider(
//           create: (_) => UserInfoProvider(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // 生成路由回调函数，当导航的命名路由的时候，会使用这个来生成界面
//         onGenerateRoute: Application.router.generator,
//         // 定义主题
//         theme: ThemeData(
//           primaryColor: Colors.red,
//         ),
//       ),
//     );
//   }
// }

import './request_test.dart';

main() async {
  // 需要查询的手机号，第二个会报错
  String phone1 = "13691204807";
  String phone2 = "13691204808";

  var res1 = await request(phone1);
  var res2 = await request(phone2);

  print(res1);
  print(res2);

  print('我是requestFetch函数之后的输出');
  print('此时我可以做请求完成的事情');
}
