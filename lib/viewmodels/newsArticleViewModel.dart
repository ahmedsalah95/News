import 'package:news_app/models/newsArticle.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle newsArticle}) : _newsArticle = newsArticle;

  String get title{
    return _newsArticle.title;
  }

  String get description{
    return _newsArticle.description;
  }

  String get url{
    return _newsArticle.url;
  }

  String get urlToImage{
    return _newsArticle.urlToImage;
  }
}
