/*
 * @Author: 明华
 * @Date: 2021-04-09 15:34:26
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-09 16:07:45
 * @Description: 
 * @FilePath: /frontend-training/design_mode/decorator/test.dart
 */

/// 饮料抽象类
abstract class Beverage {
  String description = "Unknown Beverage";

  String getDescription() {
    return description;
  }

  double cost();
}

/// 调料抽象类，继承饮料类
abstract class CondimentDecorator extends Beverage {
  // 调料类装饰者重新实现getDescription()方法
  String getDescription();
}

/// --------------- 饮料代码
// 浓缩咖啡是一种饮料，继承Beverage类
class Espresso extends Beverage {
  Espresso() {
    description = 'Espresso';
  }

  @override
  double cost() {
    return 1.99;
  }
}

/// 综合咖啡，继承自Beverage类
class HouseBlend extends Beverage {
  HouseBlend() {
    description = 'House Blend Coffee';
  }

  @override
  double cost() {
    return 0.89;
  }
}

// 深培咖啡
class DarkRoast extends Beverage {
  DarkRoast() {
    description = 'Dark Roast Coffee';
  }

  @override
  double cost() {
    return 0.99;
  }
}

/// ------------------ 调料代码
// 摩卡是一个装饰者调料，所以它扩展自CondimentDecorator。
class Mocha extends CondimentDecorator {
  // 用一个实例变量记录饮料，也就是被装饰者。
  // 想办法让被装饰着被记录到实例变量中。
  // 这里的做法是：把饮料当做构造器函数的参数，有构造函数将饮料记录在实例变量中。
  Beverage _beverage;

  Mocha(Beverage beverage) {
    this._beverage = beverage;
  }

  // 我们希望叙述不只是描述饮料，而是完整的连调料都描述出来。
  // 首先利用委托的做法，得到一个叙述，然后在其后加上附加的叙述。
  @override
  String getDescription() {
    return '${_beverage.getDescription()}, Mocha';
  }

  @override
  double cost() {
    // 要计算mocha饮料的价钱。
    // 首先把调用委托给被装饰者对象，以计算价钱，然后再加上mocha的价钱，得到最后结果
    return 0.20 + _beverage.cost();
  }
}

// 豆浆
class Soy extends CondimentDecorator {
  Beverage _beverage;

  Soy(Beverage beverage) {
    _beverage = beverage;
  }

  @override
  String getDescription() {
    return '${_beverage.getDescription()}, Soy';
  }

  @override
  double cost() {
    return 0.15 + _beverage.cost();
  }
}

// 奶泡
class Whip extends CondimentDecorator {
  Beverage _beverage;

  Whip(Beverage beverage) {
    _beverage = beverage;
  }

  @override
  String getDescription() {
    return '${_beverage.getDescription()}, Whip';
  }

  @override
  double cost() {
    return 0.10 + _beverage.cost();
  }
}

// 牛奶
class Milk extends CondimentDecorator {
  Beverage _beverage;

  Milk(Beverage beverage) {
    _beverage = beverage;
  }

  @override
  String getDescription() {
    return '${_beverage.getDescription()}, Milk';
  }

  @override
  double cost() {
    return 0.10 + _beverage.cost();
  }
}

/// 测试函数
main(List<String> args) {
  Beverage beverage = new Espresso();
  print('${beverage.getDescription()} \$ ${beverage.cost()}');

  Beverage beverage2 = new DarkRoast();
  beverage2 = new Mocha(beverage2);
  beverage2 = new Milk(beverage2);
  beverage2 = new Whip(beverage2);
  print('${beverage2.getDescription()} \$ ${beverage2.cost()}');

  Beverage beverage3 = new HouseBlend();
  beverage3 = new Mocha(beverage3);
  beverage3 = new Mocha(beverage3);
  beverage3 = new Soy(beverage3);
  print('${beverage3.getDescription()} \$ ${beverage3.cost()}');
}
