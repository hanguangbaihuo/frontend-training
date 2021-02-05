/*
 * @Author: 明华
 * @Date: 2021-01-08 11:25:54
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-12 18:14:21
 * @Description: 路由路径配置
 * @FilePath: /shop_flutter/lib/router/routers.dart
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:shop_flutter/page/home/home_page.dart';
import 'package:shop_flutter/router/router_handlers.dart';

class Routers {
  // 启动屏
  static String root = '/';
  // 首页
  static String home = '/home';
  //分类商品页面路径
  static String categoryGoodsList = "/categoryGoodsList";
  //商品详情页面路径
  static String goodsDetail = "/goodsDetail";
  //登录页面路径
  static String login = "/login";
  //注册页面路径
  static String register = "/register";
  //填写订单页面路径
  static String fillInOrder = "/fillInOrder";
  //地址页面路径
  static String address = "/myAddress";
  //地址编辑页面路径
  static String addressEdit = "/addressEdit";
  //我的收藏页面路径
  static String mineCollect = "/mineCollect";
  //关于我们页面路径
  static String aboutUs = "/aboutUs";
  //我的订单页面路径
  static String mineOrder = "/mineOrder";
  //我的订单详情页面路径
  static String mineOrderDetail = "/mineOrderDetail";
  //网页加载路径
  static String webView = "/webView";
  //轮播图路径
  static String brandDetail = "/brandDetail";

  // 配置路由
  static void configureRoutes(FluroRouter router) {
    // 找不到路径对应 handler
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      print('未找到路径对应 handler');
      return null;
    });

    // 定义路径对应的 handler
    router.define(root, handler: loadingHandler);
    router.define(home, handler: homeHandler);
    // router.define(categoryGoodsList, handler: categoryGoodsListHandler);
    // router.define(login, handler: loginHandler);
    // router.define(register, handler: registerHandler);
    // router.define(goodsDetail, handler: goodsDetailsHandler);
    // router.define(fillInOrder, handler: fillInOrderHandler);
    // router.define(address, handler: addressHandler);
    // router.define(addressEdit, handler: addressEditHandler);
    // router.define(mineCollect, handler: collectHandler);
    // router.define(aboutUs, handler: aboutHandler);
    // router.define(mineOrder, handler: orderHandler);
    // router.define(mineOrderDetail, handler: orderDetailHandler);
    router.define(webView, handler: webViewHandler);
  }
}
