/*
 * @Author: 明华
 * @Date: 2021-01-11 14:57:06
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 15:23:28
 * @Description: 
 * @FilePath: /shop_flutter/lib/event/cart_number_event.dart
 */
import 'package:event_bus/event_bus.dart';

EventBus cartNumberEventBus = EventBus();

class CartNumberEvent {
  var number;

  CartNumberEvent(this.number);
}
