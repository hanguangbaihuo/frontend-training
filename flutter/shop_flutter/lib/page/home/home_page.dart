/*
 * @Author: 明华
 * @Date: 2021-01-08 11:18:58
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 18:30:19
 * @Description: 
 * @FilePath: /shop_flutter/lib/page/home/home_page.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_flutter/config/index.dart';
import 'package:shop_flutter/widgets/loading_dialog_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 690),
      allowFontScaling: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(KString.HOME_TITLE),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: contentWidget(),
      ),
    );
  }

  Widget contentWidget() {
    return LoadingDialogWidget();
  }
}
