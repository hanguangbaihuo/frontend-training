/*
 * @Author: 明华
 * @Date: 2021-01-08 11:30:58
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 17:47:44
 * @Description: 
 * @FilePath: /shop_flutter/lib/utils/string_util.dart
 */

import 'dart:convert';

// 字符串处理工具
class StringUtil {
  // 字符串 json 编码
  static String encode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  // 字符串 json 解码
  static String decode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
