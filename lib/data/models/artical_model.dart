import 'package:news_app_task/domain/entities/article.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String content;
  final String urlToImage;
  final String publishedAt;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.urlToImage,
      required this.publishedAt});

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  Article toEntity() {
    return Article(
        author: author,
        title: title,
        description: description,
        content: content,
        urlToImage: urlToImage,
        publishedAt: publishedAt);
  }
}
