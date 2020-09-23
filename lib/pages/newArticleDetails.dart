import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';



class NewArticleDetails extends StatelessWidget {

  NewsArticleViewModel article;

  NewArticleDetails({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('${article.title}'),

     ),
      body: WebView(initialUrl: article.url),
    );
  }
}
