/*
 * @Author: 明华
 * @Date: 2021-01-11 17:22:31
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 17:22:31
 * @Description: 
 * @FilePath: /shop_flutter/lib/model/user_model.g.dart
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['userInfo'] == null
        ? null
        : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    json['token'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userInfo': instance.userInfo,
      'token': instance.token,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['nickName'] as String,
    json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'avatarUrl': instance.avatarUrl,
    };
