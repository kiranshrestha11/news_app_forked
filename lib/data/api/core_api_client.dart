import 'dart:convert';
import 'dart:developer';

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
}
