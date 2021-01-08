/*
 * @Author: 明华
 * @Date: 2021-01-08 11:31:15
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 17:55:55
 * @Description: 
 * @FilePath: /shop_flutter/lib/utils/toast_util.dart
 */

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_flutter/config/index.dart';

// Toast 提示组件显示工具
class ToastUtil {
  static showToast(String message) {
    Fluttertoast.showToast(
      // 提示消息
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      // 居中
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      // 背景色
      backgroundColor: KColor.toastBgColor,
      // 文本颜色
      textColor: KColor.toastTextColor,
      fontSize: ScreenUtil().setSp(28.0),
    );
  }
}
