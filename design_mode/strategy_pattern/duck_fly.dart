/*
 * @Author: 明华
 * @Date: 2021-03-16 17:26:19
 * @LastEditors: 明华
 * @LastEditTime: 2021-03-16 18:10:24
 * @Description: 会飞的鸭子
 * @FilePath: /frontend-training/design_mode/strategy_pattern/duck_fly.dart
 */

/// 飞行行为超类
abstract class FlyBehavior {
  void fly();
}

// 翅膀飞行
class FlyWithWings extends FlyBehavior {
  void fly() {
    print('使用翅膀飞行');
  }
}

/// 不会飞行
class FlyNoWay extends FlyBehavior {
  void fly() {
    print('不会飞');
  }
}

/// 叫声行为类
abstract class QuackBehavior {
  void quack();
}

/// 呱呱叫
class Quack extends QuackBehavior {
  void quack() {
    print('呱呱叫');
  }
}

/// 吱吱叫
class Squeak extends QuackBehavior {
  void quack() {
    print('吱吱叫');
  }
}

/// 不会叫
class MuteQuack extends QuackBehavior {
  void quack() {
    print('不会叫');
  }
}

/// 鸭子类
abstract class Duck {
  FlyBehavior flyBehavior;
  QuackBehavior quackBehavior;

  // 构造函数
  Duck(this.flyBehavior, this.quackBehavior);
  // Duck(fb, qb) {
  //   this.flyBehavior = fb;
  //   this.quackBehavior = qb;
  // }

  // 外观
  void display();

  // 飞行
  void performFly() {
    flyBehavior.fly();
  }

  // 叫声
  void performQuack() {
    quackBehavior.quack();
  }

  void setFly(FlyBehavior fb) {
    this.flyBehavior = fb;
  }

  void setQuack(QuackBehavior qb) {
    this.quackBehavior = qb;
  }

  // 游泳
  void swim() {
    print('游泳');
  }
}

/// 野鸭
class MallardDuck extends Duck {
  MallardDuck()
      : super(
          new FlyWithWings(),
          new Quack(),
        );

  @override
  void display() {
    print('我是野鸭');
  }
}

/// 红头鸭
class RedheadDuck extends Duck {
  RedheadDuck()
      : super(
          new FlyWithWings(),
          new Quack(),
        );

  @override
  void display() {
    print('红头鸭');
  }
}

/// 橡皮鸭
class RubberDuck extends Duck {
  RubberDuck()
      : super(
          new FlyNoWay(),
          new Squeak(),
        );

  @override
  void display() {
    print('橡皮鸭');
  }
}

/// 测试
void main() {
  MallardDuck mallardDuck = new MallardDuck();
  RedheadDuck redheadDuck = new RedheadDuck();
  RubberDuck rubberDuck = new RubberDuck();

  mallardDuck.display();
  mallardDuck.swim();
  mallardDuck.performFly();
  mallardDuck.performQuack();
  print('\n');

  redheadDuck.display();
  redheadDuck.swim();
  redheadDuck.performFly();
  redheadDuck.performQuack();
  print('\n');

  rubberDuck.display();
  rubberDuck.swim();
  rubberDuck.performFly();
  rubberDuck.performQuack();
  print('\n');

  // 动态设置鸭子行为
  print('动态设置鸭子行为后：');
  mallardDuck.setFly(new FlyNoWay());
  mallardDuck.setQuack(new MuteQuack());
  mallardDuck.display();
  mallardDuck.swim();
  mallardDuck.performFly();
  mallardDuck.performQuack();
}
