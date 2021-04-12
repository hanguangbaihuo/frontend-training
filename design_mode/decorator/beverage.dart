/*
 * @Author: 明华
 * @Date: 2021-04-09 15:28:25
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-09 15:30:26
 * @Description: 饮料类
 * @FilePath: /frontend-training/design_mode/decorator/beverage.dart
 */

abstract class Beverage {
  String description = "Unknown Beverage";

  String getDescription() {
    return description;
  }

  double cost();
}
