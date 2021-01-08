/*
 * @Author: 明华
 * @Date: 2021-01-08 11:28:54
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 16:05:41
 * @Description: 路由参数转换工具
 * @FilePath: /shop_flutter/lib/utils/fluro_convert_util.dart
 */

/// JSON 序列化
import 'dart:convert';

/// fluro 参数处理工具
class FluroConvertUtil {
  // Object 转为 String Json
  static String objectToString<T>(T t) {
    return fluroCnParamsEncode(jsonEncode(t));
  }

  // String Json 转为 Map
  static Map<String, dynamic> stringToMap(String str) {
    return json.decode(fluroCnParamsDecode(str));
  }

  // fluro 传递中文参数前先转换，fluro 不支持中文传递
  static String fluroCnParamsEncode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  // fluro 传递后取出参数解析
  static String fluroCnParamsDecode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
