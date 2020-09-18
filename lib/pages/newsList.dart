import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('أخبار مصر'),
      ),
      body: ListView.builder(
          itemCount: vm.articles.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(vm.articles[index].urlToImage)),
              title: Text(vm.articles[index].title),
            );
          }),
    );
  }
}
