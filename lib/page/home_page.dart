import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/component/swiper_widget.dart';
import 'package:flutter_shop/service/service_base.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我们的生活'),
        ),
        body: FutureBuilder(
            future: getData('homePageContent', null),
            builder: (context, response) {
              if (response.hasData) {
                var data = json.decode(response.data);
                List<Map> swiperDataList =
                    (data['data']['slides'] as List).cast();
                return Column(
                  children: [
                    SwiperWidget(
                      swiperDatas: swiperDataList,
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中...'),
                );
              }
            }));
  }

  Future getHttp(String text) async {
    try {
      Dio _dio = Dio();
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
//          if(cert.pem==PEM){ // Verify the certificate
//            return true;
//          }
          return true;
        };
      };
      Response response;
      var data = {'name': text};
      response = await _dio.get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女",
          queryParameters: data
          //  queryParameters:data
          );
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
