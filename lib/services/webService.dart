
import 'dart:convert';

import 'package:news_app/models/newsArticle.dart';
import 'package:http/http.dart' as http;
class WebService{
  Future<List<NewsArticle>> fetchTopHeading() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=eg&apiKey=1c4be2219c1f415f935a5af3c11c22e8';
    final response = await http.get(url);
    if(response.statusCode ==200){

      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article)=>NewsArticle.fromJson(article)).toList();
    }else{
        throw Exception('no response returned');
    }
  }
}