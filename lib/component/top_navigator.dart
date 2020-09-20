import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorDatas;
  const TopNavigator({Key key, this.navigatorDatas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(600),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2.0,
            ),
            itemCount: navigatorDatas.length,
            itemBuilder: (context, index) {
              return _gridViewItemUI(context, navigatorDatas[index]);
            }));
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
        onTap: () {
          print('点击了导航');
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(
                item['image'],
                width: ScreenUtil().setWidth(95),
                height: ScreenUtil().setHeight(95),
              ),
              Text(item['mallCategoryName'])
            ],
          ),
        ));
  }
}
