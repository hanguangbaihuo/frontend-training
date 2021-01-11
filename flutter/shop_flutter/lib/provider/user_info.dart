/*
 * @Author: 明华
 * @Date: 2021-01-08 11:24:16
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 17:13:26
 * @Description: 
 * @FilePath: /shop_flutter/lib/provider/user_info.dart
 */

import 'package:flutter/material.dart';
import 'package:shop_flutter/model/user_model.dart';

// 用户信息状态管理
class UserInfoProvider with ChangeNotifier {
  // 用户数据模型
  UserModel userModel;

  // 更新用户信息
  updateInfo(UserModel userModel) {
    this.userModel = userModel;
    // 通知刷新数据
    notifyListeners();
  }
}
