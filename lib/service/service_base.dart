import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_shop/config/service_constants.dart';

Future getData(path, data) async {
  try {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var url = servicePath[path];
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('获取后段数据异常：' + response.statusCode.toString());
    }
  } catch (e) {
    print('接口异常' + e);
  }
}
