import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shop/page/cart_page.dart';
import 'package:flutter_shop/page/category_page.dart';
import 'package:flutter_shop/page/home_page.dart';
import 'package:flutter_shop/page/mine_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    ScreenUtil.init();
    print('设备宽度:${ScreenUtil().screenWidth}');
    print('设备高度:${ScreenUtil().screenHeight}');
    print('设备像素密度:${ScreenUtil().pixelRatio}');
    super.initState();
  }
  final List<BottomNavigationBarItem> _bottomBars = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(Icons.my_location), title: Text('我的'))
  ];
  final List<Widget> _bodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MinePage()
  ];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _bodies[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentPage,
            items: this._bottomBars,
            onTap: (index){
              setState(() {
                this._currentPage=index;
              });
            },));
  }
}
