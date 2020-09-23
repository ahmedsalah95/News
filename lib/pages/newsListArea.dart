import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

class NewsArea extends StatelessWidget {
  List<NewsArticleViewModel> articles;

  NewsArea({this.articles});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(articles[index].title),
              leading: Container(
                width: 100,
                height: 100,
                child: Container(
                    child: FadeInImage.assetNetwork(
                        placeholder: 'images/placeholder.png',
                        image: articles[index].urlToImage == null
                            ? 'https://placeholder.com/'
                            : articles[index].urlToImage)),
              ));
        });
  }
}
