/*
 * @Author: 明华
 * @Date: 2021-01-08 11:34:45
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-09 21:35:48
 * @Description: 网页加载组件
 * @FilePath: /shop_flutter/lib/widgets/webview_widget.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// 网页加载组件
class WebViewWidget extends StatelessWidget {
  // 路径
  final url;
  // 标题
  final title;
  // 构造方法
  WebViewWidget(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 显示网页标题
        title: Text(title),
        centerTitle: true,
      ),
      // 使用 WebViewScaffold 加载网页
      body: WebviewScaffold(
        url: url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}
