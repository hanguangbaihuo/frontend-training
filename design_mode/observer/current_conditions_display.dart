/*
 * @Author: 明华
 * @Date: 2021-04-02 14:59:08
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-02 15:24:04
 * @Description: 当前天气布告板
 * @FilePath: /frontend-training/design_mode/observer/current_conditions_display.dart
 */
import './observer.dart';
import './display_element.dart';
import './weather_data.dart';

class CurrentConditionsDisplay implements Observer, DisplayElement {
  WeatherData _weatherData;
  double _temperature;
  double _humidity;

  CurrentConditionsDisplay(WeatherData weatherData) {
    _weatherData = weatherData;
    _weatherData.registerObserver(this);
  }

  @override
  void update(double temperature, double humidity, double pressure) {
    _temperature = temperature;
    _humidity = humidity;

    display();
  }

  @override
  void display() {
    print('温度：${_temperature}；湿度：${_humidity}');
  }
}
