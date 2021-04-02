/*
 * @Author: 明华
 * @Date: 2021-04-02 15:11:07
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-02 15:24:21
 * @Description: 预报
 * @FilePath: /frontend-training/design_mode/observer/forecast_display.dart
 */
import './observer.dart';
import './display_element.dart';
import './weather_data.dart';

class ForecastDisplay implements Observer, DisplayElement {
  WeatherData _weatherData;
  double _pressure;

  ForecastDisplay(WeatherData weatherData) {
    _weatherData = weatherData;
    _weatherData.registerObserver(this);
  }

  @override
  void update(double temperature, double humidity, double pressure) {
    _pressure = pressure;

    display();
  }

  @override
  void display() {
    print('气压：${_pressure}');
  }
}
