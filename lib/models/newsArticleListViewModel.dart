import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/services/webService.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

class NewsArticleListViewModel  extends ChangeNotifier{
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();



  void populateHeadLines() async{
    List<NewsArticle> newsArticles = List<NewsArticle>();
    newsArticles = await WebService().fetchTopHeading();
    this.articles = newsArticles.map((article)=>NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }
}
