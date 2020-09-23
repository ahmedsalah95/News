import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticleListViewModel.dart';
import 'package:news_app/pages/newsListArea.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

Widget _buildNews(NewsArticleListViewModel vm) {
  switch (vm.loadingstatus) {
    case loadingStatus.searching:
      return CircularProgressIndicator();
    case loadingStatus.completed:
      return  Expanded(child: NewsArea(articles: vm.articles));
    case  loadingStatus.empty:
      return Text('No results found!!');
  }
}

class _NewsListState extends State<NewsList> {
  final _controller = TextEditingController();

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
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    vm.populateSearch(value);
                  }
                },
                controller: _controller,
                decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    labelText: 'ابحث هنا',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          vm.populateHeadLines();
                        })),
              ),
              SizedBox(
                height: 5,
              ),
              _buildNews(vm)
            ],
          ),
        ));
  }
}
