class Article {
  final String? author;
  final String? title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        url: json['url'],
        publishedAt: DateTime.parse(json['publishedAt']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        content: json['content']);
  }
}
