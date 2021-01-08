/*
 * @Author: 明华
 * @Date: 2021-01-08 11:04:19
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 11:53:44
 * @Description: 
 * @FilePath: /shop_flutter/lib/config/icon.dart
 */

import 'package:flutter/widgets.dart';

class KIcon {
  static const String FONT_FAMILY = 'ShopICon'; //字体名称
  static const IconData PASS_WORD =
      const IconData(0xe617, fontFamily: KIcon.FONT_FAMILY); //密码图标
  static const IconData ADDRESS =
      const IconData(0xe63c, fontFamily: KIcon.FONT_FAMILY); //地址图标
  static const IconData ORDER =
      const IconData(0xe634, fontFamily: KIcon.FONT_FAMILY); //订单图标
  static const IconData COLLECTION =
      const IconData(0xe61e, fontFamily: KIcon.FONT_FAMILY); //收藏图标
  static const IconData ABOUT_US =
      const IconData(0xe654, fontFamily: KIcon.FONT_FAMILY); //关于我们图标
}
