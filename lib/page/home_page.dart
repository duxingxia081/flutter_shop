import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();
  String _showText = '美女';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: '商品类型',
                  helperText: '请输入商品类型',
                  contentPadding: EdgeInsets.all(10)),
              autofocus: false,
            ),
            RaisedButton(
              onPressed: _choiseAction,
              child: Text('选择完毕'),
            ),
            Text(_showText)
          ],
        ),
      ),
    ));
  }

  void _choiseAction() {
    if (_textEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('商品类型不能为空'),
              ));
    } else {
      getHttp(_textEditingController.text.toString()).then((value) {
        setState(() {
          print(value);
          _showText = value['data']['name'];
        });
      });
    }
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
