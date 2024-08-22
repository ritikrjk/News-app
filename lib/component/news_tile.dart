import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  final void Function()? onTap;
  const NewsTile({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text(article.author ?? "unable to load");
  }
}
