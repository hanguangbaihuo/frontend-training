/*
 * @Author: 明华
 * @Date: 2021-01-09 21:36:50
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-11 15:50:14
 * @Description: 
 * @FilePath: /shop_flutter/lib/widgets/cart_number_widget.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_flutter/event/cart_number_event.dart';

// 定义数量改变回调函数
typedef OnNumberChange(int number);

// 购物车数量加减组件
class CartNumberWidget extends StatefulWidget {
  // 数量改变回调方法
  OnNumberChange onNumberChange;
  // 计数
  var _number;
  // 构造方法，传入初始值及回调方法
  CartNumberWidget(this._number, this.onNumberChange);

  @override
  _CartNumberWidgetState createState() => _CartNumberWidgetState();
}

class _CartNumberWidgetState extends State<CartNumberWidget> {
  var goodsNumber; // 商品数量
  OnNumberChange onNumberChange; // 回调方法

  @override
  void initState() {
    super.initState();
    goodsNumber = widget._number;
    onNumberChange = widget.onNumberChange;
  }

  // 监听数量改变事件
  _listener() {
    cartNumberEventBus
        .on<CartNumberEvent>()
        .listen((CartNumberEvent cartNumberEvent) {
      // 设置当前的商品数量
      setState(() {
        goodsNumber = cartNumberEvent.number;
      });
    });
  }

  // 减少处理
  _reduce() {
    // 判断当前商品数量是否大于1
    if (goodsNumber > 1) {
      setState(() {
        goodsNumber = goodsNumber - 1;
      });
    }
    print('${widget._number}');
    // 调用回调方法
    onNumberChange(goodsNumber);
  }

  // 增加处理
  _add() {
    setState(() {
      goodsNumber = goodsNumber + 1;
    });
    print('${goodsNumber}');
    onNumberChange(goodsNumber);
  }

  @override
  Widget build(BuildContext context) {
    // 调用事件监听
    _listener();
    return Container(
      // 设置宽高
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(50),
      // 水平布局
      child: Row(
        children: <Widget>[
          // 减少
          InkWell(
            onTap: () => _reduce(),
            child: Container(
              width: ScreenUtil().setWidth(50),
              height: double.infinity,
              alignment: Alignment.center,
              // 添加边框组件
              decoration: ShapeDecoration(
                shape: Border(
                  left: BorderSide(color: Colors.grey, width: 1.0),
                  top: BorderSide(color: Colors.grey, width: 1.0),
                  right: BorderSide(color: Colors.grey, width: 1.0),
                  bottom: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              child: Text(
                '-',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil().setSp(26),
                ),
              ),
            ),
          ),
          // 中间数量容器
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: ScreenUtil().setWidth(50),
            decoration: ShapeDecoration(
              shape: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            child: Text(
              goodsNumber,
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(26.0),
              ),
            ),
          ),
          // 增加
          InkWell(
            onTap: () => _add(),
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(50),
              height: double.infinity,
              decoration: ShapeDecoration(
                shape: Border(
                  left: BorderSide(color: Colors.grey, width: 1.0),
                  top: BorderSide(color: Colors.grey, width: 1.0),
                  right: BorderSide(color: Colors.grey, width: 1.0),
                  bottom: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
