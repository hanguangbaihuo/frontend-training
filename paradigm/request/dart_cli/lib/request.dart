/*
 * @Author: 明华
 * @Date: 2021-02-05 07:03:58
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 15:18:57
 * @Description: 
 * @FilePath: /frontend-training/paradigm/request/dart_cli/lib/request.dart
 */
import 'utils.dart';

Future request(String phone) {
  // HttpUtil request = new HttpUtil();
  var request = HttpUtil();
// 查询验证码接口
  var apiQuerySmsCode =
      'https://backend5.dongyouliang.com/api/core/sms_checkcode/';
  var parameters = {
    'phone': phone,
  };

  return request.get(
    '$apiQuerySmsCode',
    parameters: parameters,
  );
}
