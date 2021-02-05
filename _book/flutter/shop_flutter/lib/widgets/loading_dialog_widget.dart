/*
 * @Author: 明华
 * @Date: 2021-01-08 11:33:58
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-09 21:18:59
 * @Description: 加载中对话框组件
 * @FilePath: /shop_flutter/lib/widgets/loading_dialog_widget.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_flutter/config/index.dart';

// 加载数据组件
class LoadingDialogWidget extends StatefulWidget {
  @override
  _LoadingDialogWidgetState createState() => _LoadingDialogWidgetState();
}

class _LoadingDialogWidgetState extends State<LoadingDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFoldingCube(
          size: ScreenUtil().setWidth(60.0),
          color: KColor.watingColor,
        ),
      ),
    );
  }
}
