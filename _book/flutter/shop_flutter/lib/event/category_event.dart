/*
 * @Author: 明华
 * @Date: 2021-01-11 15:05:43
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 15:08:17
 * @Description: 
 * @FilePath: /shop_flutter/lib/event/category_event.dart
 */

import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

// 分类事件，用于点击一级分类后出发获取二级分类事件
class CategoryEvent {
  int id; // 分类id
  String categoryName; // 分类名称
  String categoryImage; // 分类图片
  // 构造方法
  CategoryEvent(this.id, this.categoryName, this.categoryImage);
}
