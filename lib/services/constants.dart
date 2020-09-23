class Constants {
  static String topHeadLines =
      'https://newsapi.org/v2/top-headlines?country=eg&apiKey=1c4be2219c1f415f935a5af3c11c22e8';

  static String Search(String keyword) {
    String url =
        'https://newsapi.org/v2/everything?q=$keyword&apiKey=1c4be2219c1f415f935a5af3c11c22e8';
    return url;
  }
}
