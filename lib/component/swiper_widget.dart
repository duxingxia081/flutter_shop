import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  final List swiperDatas;
  const SwiperWidget({Key key, this.swiperDatas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(450),
      width: ScreenUtil().setWidth(1080),
      child: Swiper(
        itemCount: swiperDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            swiperDatas[index]['image'],
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
