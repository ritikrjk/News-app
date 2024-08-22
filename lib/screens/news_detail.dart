import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';

class NewsDetails extends StatelessWidget {
  final Article article;
  const NewsDetails({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Image.network(
                "${article.urlToImage}",
                errorBuilder:
                    (context, Object exception, StackTrace? stackTrace) {
                  return Text('Could not load the image');
                },
                scale: 1.0,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${article.title}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${article.description}',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
