/*
 * @Author: 明华
 * @Date: 2021-01-08 11:30:24
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 17:25:01
 * @Description: 本地存储工具
 * @FilePath: /shop_flutter/lib/utils/shared_preferences_util.dart
 */

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_flutter/config/index.dart';

// 本地存储工具
class SharedPreferencesUtil {
  // token 字符串
  static String token = '';

  // 获取 token 值
  static Future getToken() async {
    if (token == null || token.isEmpty) {
      // 从本地取出 token
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(KString.TOKEN) ?? null;
    }
    return token;
  }

  // 获取头像 url
  static Future getImageHead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(KString.HEAD_URL);
  }

  // 获取昵称
  static Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(KString.NICK_NAME);
  }
}
