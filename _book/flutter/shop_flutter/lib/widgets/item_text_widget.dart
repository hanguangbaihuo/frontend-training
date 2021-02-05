/*
 * @Author: 明华
 * @Date: 2021-01-08 11:33:25
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-09 21:12:05
 * @Description: 文本项组件
 * @FilePath: /shop_flutter/lib/widgets/item_text_widget.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 文本组件
class ItemTextWidget extends StatelessWidget {
  // 左侧文本
  var leftText;
  // 右侧文本
  var rightText;
  // 回调方法
  VoidCallback callback;
  // 构造方法，回调方法为可选参数
  ItemTextWidget(this.leftText, this.rightText, {this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 单击回调
      onTap: () {
        callback();
      },
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20.0),
          right: ScreenUtil().setWidth(20.0),
        ),
        height: ScreenUtil().setHeight(80.0),
        child: Row(
          children: <Widget>[
            // 左侧文本
            Text(
              leftText,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(26.0),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                // 右侧文本
                child: Text(
                  rightText,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(26.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
