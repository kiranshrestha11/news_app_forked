import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:news_app/core/config.dart';

class CoreApiClient {
  Future getData({required String endpoint}) async {
    final result = await Client().get(Uri.parse(Config.baseUrl + endpoint));

    if (result.statusCode == 200) {
      final data = json.decode(result.body);
      return data;
    } else {
      log(result.reasonPhrase.toString());
      return result.reasonPhrase;
    }
  }

  Future postData({required Map<String, dynamic> data}) async {
    try {
      final result = await Dio(BaseOptions(headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer 1|gT1eXzBYFLboVv4lEvoYvfKTVbnPNGBeoJ7txgr8"
      })).post(
        'http://doko.mithobachan.com/api/users/create',
        data: data,
      );
      return {"message": "success", "data": result.data['response']};
    } on DioError catch (e) {
      return {"message": "fail", "data": e.response!.data['response']};
    }
  }
}
