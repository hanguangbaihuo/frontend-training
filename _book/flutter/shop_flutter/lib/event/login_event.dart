/*
 * @Author: 明华
 * @Date: 2021-01-08 11:05:23
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 15:11:01
 * @Description: 
 * @FilePath: /shop_flutter/lib/event/login_event.dart
 */

import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();

// 登陆事件
class LoginEvent {
  bool isLogin; // 是否登录
  String nickName; // 昵称
  String url; // 头像url
  // 构造方法
  LoginEvent(this.isLogin, {this.nickName, this.url});
}
