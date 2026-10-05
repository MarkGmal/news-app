// apis by http package

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_response.dart';
import 'package:news_app/Model/source_response.dart';
import 'package:news_app/apis/api_constant.dart';
import 'package:news_app/apis/end_points.dart';

class ApisManger {
  static Future<SourceResponse> getSources() async {
    try {
      // https://newsapi.org/v2/top-headlines/sources?apiKey=2965ef6176d9480899b7e5b9cc639ad0
      Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.sourceApi, {
        "apiKey": ApiConstant.apiKey,
      });
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      // https://newsapi.org/v2/everything?q=bitcoin&apiKey=2965ef6176d9480899b7e5b9cc639ad0
      Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi, {
        "apiKey": ApiConstant.apiKey,
        "sources": sourceId,
      });
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
