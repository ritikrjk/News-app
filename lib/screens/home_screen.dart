import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/component/category_widet.dart';
import 'package:news_api/component/theme_widget.dart';

import 'package:news_api/const.dart';
import 'package:news_api/models/news_model.dart';
import 'package:news_api/screens/news_detail.dart';
import 'package:news_api/services/news_service.dart';
import 'package:news_api/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoryNews = [
    'Random',
    'Technology',
    'Stocks',
    'Science',
    'Crime',
    'Jobs'
  ];
  NewsService _newsService = NewsService(apiKey: API_KEY);
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _loadArticles(categoryNews[0]);
    });
  }

  _loadArticles(String category) async {
    try {
      articles = await _newsService.getNewsByCategory(category);
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'News',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          backgroundColor: Colors.grey,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10), child: ThemeWidget())
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    children: categoryNews
                        .map((category) => CategoryWidget(
                              category: category,
                              onTap: () => _loadArticles(category),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: articles.isEmpty
                  ?
                  //empty
                  Center(
                      child: Text("Unable to fetch your request for the time"),
                    )
                  : ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final singleArticle = articles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            elevation: 3,
                            child: ListTile(
                                // leading: Container(
                                //     padding: EdgeInsets.all(8),
                                //     decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         color: Colors.white24),
                                //     child: Text("${index + 1}")),
                                title: Image.network(
                                  "${singleArticle.urlToImage}, ",
                                  errorBuilder: (context, Object exception,
                                      StackTrace? stackTrace) {
                                    return Text('Could not load the image');
                                  },
                                ),
                                // Text(singleArticle.title ?? " Unable to load"),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 13),
                                  child: Text(
                                    singleArticle.title ?? " Unable to load",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsDetails(
                                              article: singleArticle)));
                                }),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }
}
