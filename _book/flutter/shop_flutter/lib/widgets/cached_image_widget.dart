/*
 * @Author: 明华
 * @Date: 2021-01-08 11:31:42
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-08 19:11:31
 * @Description: 图片缓存组件
 * @FilePath: /shop_flutter/lib/widgets/cached_image_widget.dart
 */

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_flutter/config/index.dart';

// 缓存图片组件
class CachedImageWidget extends StatelessWidget {
  // 宽度
  double width;
  // 高度
  double height;
  // 图片地址
  String url;
  // 构造方法
  CachedImageWidget(this.width, this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      // 使用 CachedNetworkImage 组件
      child: CachedNetworkImage(
        // 图片地址
        imageUrl: this.url,
        // 填充方式
        fit: BoxFit.cover,
        width: this.width,
        height: this.height,
        // 等待提示
        placeholder: (BuildContext context, String url) {
          return Container(
            width: this.width,
            height: this.height,
            color: Colors.grey[350],
            alignment: Alignment.center,
            // 加载提示
            child: Text(
              KString.LOADING,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26.0),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
