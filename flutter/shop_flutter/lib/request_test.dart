/*
 * @Author: 明华
 * @Date: 2021-02-05 06:37:16
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 06:57:53
 * @Description: dio 调用测试
 * @FilePath: /frontend-training/flutter/shop_flutter/lib/request_test.dart
 */

// import 'package:dio/dio.dart';
import 'dart:ui';
import 'package:shop_flutter/utils/http_util.dart';

request(String phone) {
  HttpUtil request = new HttpUtil();
// 查询验证码接口
  String apiQuerySmsCode =
      "https://backend5.dongyouliang.com/api/core/sms_checkcode/";
  Map<String, dynamic> parameters = new Map();
  parameters['phone'] = phone;
  return request.get(
    '$apiQuerySmsCode',
    parameters: parameters,
  );
}
