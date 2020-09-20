import 'package:flutter/material.dart';
import 'package:flutter_shop/page/index_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title:'家乡特产',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: IndexPage(),
      ),
    );
  }
}
