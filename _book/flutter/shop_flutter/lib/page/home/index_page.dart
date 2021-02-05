/*
 * @Author: 明华
 * @Date: 2021-01-08 11:19:32
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-12 17:03:33
 * @Description: 索引页面
 * @FilePath: /shop_flutter/lib/page/home/index_page.dart
 */

import 'package:flutter/material.dart';
import 'package:shop_flutter/config/index.dart';
import 'package:shop_flutter/page/home/home_page.dart';
import 'package:shop_flutter/page/category/category_page.dart';
import 'package:shop_flutter/page/cart/cart_page.dart';
import 'package:shop_flutter/page/mine/mine_page.dart';

// 索引页面用于切换几个主要页面
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 当前选项卡索引
  int _selectedIndex = 0;
  // 主要页面索引
  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    // 添加主要页面至列表中，使用 .. 级联操作
    _list
      ..add(HomePage())
      ..add(CategoryPage())
      ..add(CartPage())
      ..add(MinePage());
  }

  // 选项卡点击回调
  void _onItemTapped(int index) {
    setState(() {
      // 设置当前索引状态值
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面根据索引进行切换
      body: IndexedStack(
        // 当前索引
        index: _selectedIndex,
        // 绑定页面列表
        children: _list,
      ),
      // 页面底部选项卡
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          // 首页
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: KString.HOME,
          ),
          // 分类
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: KString.CATEGORY,
          ),
          // 购物车
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: KString.SHOP_CAR,
          ),
          // 我的
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: KString.MINE,
          ),
        ],
        // 绑定当前索引
        currentIndex: _selectedIndex,
        // 选中项的颜色
        selectedItemColor: KColor.indexTabSelectedColor,
        // 未选中项的颜色
        unselectedItemColor: KColor.indexTabUnSelectedColor,
        // 点击回调方法
        onTap: _onItemTapped,
      ),
    );
  }
}
