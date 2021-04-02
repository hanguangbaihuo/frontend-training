/*
 * @Author: 明华
 * @Date: 2021-04-02 15:15:36
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-02 15:24:49
 * @Description: 统计版
 * @FilePath: /frontend-training/design_mode/observer/statistics_display.dart
 */
import './observer.dart';
import './display_element.dart';
import './weather_data.dart';

class StatisticsDisplay implements Observer, DisplayElement {
  WeatherData _weatherData;
  double _temperature;
  double _humidity;
  double _pressure;

  StatisticsDisplay(WeatherData weatherData) {
    _weatherData = weatherData;
    _weatherData.registerObserver(this);
  }

  @override
  void update(double temperature, double humidity, double pressure) {
    _temperature = temperature;
    _humidity = humidity;
    _pressure = pressure;

    display();
  }

  @override
  void display() {
    print('温度：${_temperature}；湿度：${_humidity}；气压：${_pressure}');
  }
}
