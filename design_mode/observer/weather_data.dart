/*
 * @Author: 明华
 * @Date: 2021-04-02 14:19:58
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-09 10:38:25
 * @Description: 天气观测数据文件，实现主题接口
 * @FilePath: /frontend-training/design_mode/observer/weather_data.dart
 */
import './subject.dart';
import './observer.dart';

class WeatherData implements Subject {
  List _observers;
  double _temperature; // 温度
  double _humidity; // 湿度
  double _pressure; // 压强

  WeatherData() {
    _observers = [];
  }

  @override
  void registerObserver(Observer observer) {
    this._observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    this._observers.remove(observer);
  }

  @override
  void notifyObserver() {
    _observers.forEach((element) {
      element.update(_temperature, _humidity, _pressure);
    });
  }

  // 测量数据发生变化时调用此函数
  void measurementsChanged() {
    this.notifyObserver();
  }

  // 设置测量值，测试使用方法
  void setMeasurements(double temperature, double humidity, double pressure) {
    this._temperature = temperature;
    this._humidity = humidity;
    this._pressure = pressure;

    this.measurementsChanged();
  }
}
