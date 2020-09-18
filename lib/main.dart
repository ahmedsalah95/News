import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticleListViewModel.dart';
import 'package:news_app/pages/newsList.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'News', home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(), child: NewsList());
  }
}
