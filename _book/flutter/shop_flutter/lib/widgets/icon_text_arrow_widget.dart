/*
 * @Author: 明华
 * @Date: 2021-01-08 11:32:27
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 20:03:51
 * @Description: 图标文本箭头组件
 * @FilePath: /shop_flutter/lib/widgets/icon_text_arrow_widget.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextArrowWidget extends StatelessWidget {
  // 图标数据
  final IconData iconData;
  // 图标颜色
  final Color color;
  // 标题
  final title;
  // 单机回调方法
  final VoidCallback callback;

  IconTextArrowWidget(
    this.iconData,
    this.title,
    this.color,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100.0),
      width: double.infinity,
      // 单击整个组件回调此方法
      child: InkWell(
        onTap: callback,
        // 水平布局
        child: Row(
          // 次轴居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Icon(
                iconData,
                size: ScreenUtil().setWidth(40.0),
                color: this.color,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.0),
              ),
            ),
            // 标题
            Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26.0),
                color: Colors.black54,
              ),
            ),
            // 右侧箭头
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(30.0),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: ScreenUtil().setWidth(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
