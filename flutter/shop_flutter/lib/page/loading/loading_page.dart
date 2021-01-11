/*
 * @Author: 明华
 * @Date: 2021-01-08 11:20:00
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 16:55:01
 * @Description: 启动屏页面
 * @FilePath: /shop_flutter/lib/page/loading/loading_page.dart
 */

import 'package:flutter/material.dart';
import 'package:shop_flutter/utils/navigator_util.dart';

// 加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // 延迟3秒执行
    Future.delayed(Duration(seconds: 3), () {
      // 跳转至应用首页
      NavigatorUtil.goShopMainPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Image.asset(
          'images/loading.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
