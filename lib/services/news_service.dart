// https://newsapi.org/v2/everything?q=tesla&from=2024-07-14&sortBy=language&apiKey=221655b737bb46ca944c8e0310179cf5

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/models/news_model.dart';

class NewsService {
  static const BASE_URL = "http://newsapi.org/";
  String apiKey;

  NewsService({required this.apiKey});

  Future<List<Article>> getNewsByCategory(String category) async {
    try {
      DateTime today = DateTime.now();
      final response = await http.get(Uri.parse(
          "$BASE_URL/v2/everything?q=$category&from=4${today}&sortBy=language&apiKey=$apiKey"));

      if (response.statusCode == 200) {
        List<Article> articles = (jsonDecode(response.body)['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        return articles;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
