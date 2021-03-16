/*
 * @Author: 明华
 * @Date: 2021-03-16 10:58:51
 * @LastEditors: 明华
 * @LastEditTime: 2021-03-16 14:13:02
 * @Description: 鸭子类
 * @FilePath: /frontend-training/design_mode/strategy_pattern/duck.dart
 */

/// 所有的鸭子都会呱呱叫（quack）也会游泳（swim），
/// 所以由超类负责处理这部分代码的实现
abstract class Duck {
  void quack() {
    print('呱呱叫');
  }

  void swim() {
    print('游泳');
  }

  // 因为每一种鸭子的外观都不同，所以display方法时抽象的
  void display();
}

// 子类

// 绿头鸭 野鸭
class MallardDuck extends Duck {
  void display() {
    print('我是绿头鸭');
  }
}

// 红头鸭
class RedheadDuck extends Duck {
  void display() {
    print('我是红头鸭');
  }
}

// ... 其他类型的鸭子

void main() {
  var mallardDuck = new MallardDuck();
  mallardDuck.display();
  mallardDuck.quack();
  mallardDuck.swim();

  var redheadDuck = new RedheadDuck();
  redheadDuck.display();
  redheadDuck.quack();
  redheadDuck.swim();
}
