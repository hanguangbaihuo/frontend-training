/*
 * @Author: 明华
 * @Date: 2021-04-09 15:32:04
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-09 15:33:39
 * @Description: 饮料类
 * @FilePath: /frontend-training/design_mode/decorator/condiment.dart
 */

import './beverage.dart';

abstract class CondimentDecorator extends Beverage {
  // 调料类装饰者重新实现getDescription()方法
  String getDescription();
}
