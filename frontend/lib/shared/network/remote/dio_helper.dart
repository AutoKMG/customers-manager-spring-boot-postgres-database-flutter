import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/api/v1/customers',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    dio!.options.headers = {};
    return await dio!.get(url);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    required int id,
  }) async {
    return await dio!.put(
      "$url/$id",
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    required String id,
  }) async {
    return await dio!.delete("$url/$id");
  }
}
