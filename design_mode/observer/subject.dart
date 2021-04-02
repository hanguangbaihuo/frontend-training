/*
 * @Author: 明华
 * @Date: 2021-04-02 14:20:16
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-02 14:39:26
 * @Description: 
 * @FilePath: /frontend-training/design_mode/observer/subject.dart
 */
import './observer.dart';

abstract class Subject {
  // 注册观察者
  void registerObserver(Observer observer);
  // 删除观察者
  void removeObserver(Observer observer);
  // 通知观察者
  void notifyObserver();
}
