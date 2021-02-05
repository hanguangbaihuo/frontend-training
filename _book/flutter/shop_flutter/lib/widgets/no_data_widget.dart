/*
 * @Author: 明华
 * @Date: 2021-01-08 11:34:20
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-09 21:27:25
 * @Description: 没有数据提示组件
 * @FilePath: /shop_flutter/lib/widgets/no_data_widget.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_flutter/config/index.dart';

// 没有数据提示组件
class NoDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      alignment: Alignment.center,
      child: Center(
        child: Column(
          // 垂直居中
          mainAxisAlignment: MainAxisAlignment.center,
          // 水平居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 图片提示
            Image.asset(
              'images/no_data.png',
              height: ScreenUtil().setHeight(120.0),
              width: ScreenUtil().setWidth(120.0),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(20.0),
              ),
            ),
            Text(
              KString.NO_DATA_TEXT,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28.0),
                color: KColor.defaultTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
