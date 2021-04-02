/*
 * @Author: 明华
 * @Date: 2021-04-02 15:21:32
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-02 15:27:43
 * @Description: 
 * @FilePath: /frontend-training/design_mode/observer/test.dart
 */
import './weather_data.dart';
import './current_conditions_display.dart';
import './forecast_display.dart';
import './statistics_display.dart';

void main() {
  WeatherData weatherData = WeatherData();
  CurrentConditionsDisplay currentConditionsDisplay =
      CurrentConditionsDisplay(weatherData);
  ForecastDisplay forecastDisplay = ForecastDisplay(weatherData);
  StatisticsDisplay statisticsDisplay = StatisticsDisplay(weatherData);

  weatherData.setMeasurements(80, 65, 30.4);
  weatherData.setMeasurements(60, 55, 20.6);
  weatherData.setMeasurements(100, 75, 40.8);
}
