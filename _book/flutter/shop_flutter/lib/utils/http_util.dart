/*
 * @Author: 明华
 * @Date: 2021-01-08 11:29:23
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 17:43:59
 * @Description: 网络请求工具
 * @FilePath: /shop_flutter/lib/utils/http_util.dart
 */

import 'package:dio/dio.dart';
import 'package:shop_flutter/config/index.dart';
import 'package:shop_flutter/utils/shared_preferences_util.dart';

// 定义 dio 变量
var dio;

// Http 请求处理工具，提供了 get 及 post 请求封装方法
class HttpUtil {
  // 获取 HttpUtil 实例
  static HttpUtil get instance => _getInstance();

  // 定义 HttpUtil 实例
  static HttpUtil _httpUtil;

  // 获取 HttpUtil 实例方法，工厂模式
  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  // 构造方法
  HttpUtil() {
    // 选项
    BaseOptions options = BaseOptions(
      // 连接超时
      connectTimeout: 5000,
      // 接受超时
      receiveTimeout: 5000,
    );

    // 实例化 Dio
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        print('==================== 请求数据 ====================');
        print('url = ${options.uri.toString()}');
        print('params = ${options.data}');

        // 锁住
        dio.lock();

        // 获取本地 token
        await SharedPreferencesUtil.getToken().then((token) {
          // 将 token 值放入请求头里
          options.headers[KString.TOKEN] = token;
        });

        // 解锁
        dio.unlock();
        return options;
      },
      onResponse: (Response response) {
        print('==================== 请求数据 ====================');
        print('code = ${response.statusCode}');
        print('response = ${response.data}');
      },
      onError: (DioError error) {
        print('==================== 请求错误 ====================');
        print('message = ${error.message}');
      },
    ));
  }

  // 封装 get 请求
  Future get(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    // 返回对象
    Response response;
    // 判断请求参数并发起get请求
    if (parameters != null && options != null) {
      response =
          await dio.get(url, queryParameters: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.get(url, queryParameters: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options);
    } else {
      response = await dio.get(url);
    }

    // 返回数据
    return response.data;
  }

  // 封装post请求
  Future post(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    //返回对象
    Response response;
    //判断请求参数并发起post请求
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    //返回数据
    return response.data;
  }
}
