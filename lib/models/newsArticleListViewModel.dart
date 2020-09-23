import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/services/webService.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

enum loadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  var loadingstatus = loadingStatus.completed;

  Future<void> populateSearch(keyword) async {
    loadingstatus = loadingStatus.searching;
    List<NewsArticle> newsArticles = List<NewsArticle>();
    newsArticles = await WebService().searchKeyword(keyword);
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    this.loadingstatus =
    this.articles.isEmpty ? loadingStatus.empty : loadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateHeadLines() async {
    loadingstatus = loadingStatus.searching;
    List<NewsArticle> newsArticles = List<NewsArticle>();
    newsArticles = await WebService().fetchTopHeading();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingstatus =
    this.articles.isEmpty ? loadingStatus.empty : loadingStatus.completed;
    notifyListeners();
  }
}
