/*
 * @Author: 明华
 * @Date: 2021-01-08 11:32:06
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 19:49:03
 * @Description: 分割线组件
 * @FilePath: /shop_flutter/lib/widgets/divider_line_widget.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 分割线组件
class DividerLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[350],
      height: ScreenUtil().setHeight(1.0),
    );
  }
}
