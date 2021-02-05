/*
 * @Author: 明华
 * @Date: 2021-02-05 07:01:44
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 14:55:08
 * @Description: 
 * @FilePath: /frontend-training/paradigm/request/dart_cli/bin/dart_cli.dart
 */
import 'package:dart_cli/dart_cli.dart' as dart_cli;
// import '../lib/request.dart';
import 'package:dart_cli/request.dart';

void main(List<String> arguments) async {
  print('Hello world: ${dart_cli.calculate()}!');
  // 需要查询的手机号，第二个会报错
  var phone1 = '13691204807';
  var phone2 = '13691204808';

  // try {
  var res1 = await request(phone1);
  var res2 = await request(phone2);

  print(res1);
  print(res2);
  // } catch (err) {
  //   print(err);
  // }

  print('我是requestFetch函数之后的输出');
  print('此时我可以做请求完成的事情');
}
