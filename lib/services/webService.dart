import 'dart:convert';

import 'package:news_app/models/newsArticle.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/services/constants.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeading() async {
    final response = await http.get(Constants.topHeadLines);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('no response returned');
    }
  }

  Future<List<NewsArticle>> searchKeyword(String keyword) async {
    final response = await http.get(Constants.Search(keyword));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      Iterable list = result['articles'];

      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('no response returned');
    }
  }
}
