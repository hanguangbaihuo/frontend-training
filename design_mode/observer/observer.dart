/*
 * @Author: 明华
 * @Date: 2021-04-02 14:22:02
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-09 10:34:50
 * @Description: 观察者接口文件
 * @FilePath: /frontend-training/design_mode/observer/observer.dart
 */

abstract class Observer {
  // 当主题状态改变时调用
  void update(double temperature, double humidity, double pressure);
}
