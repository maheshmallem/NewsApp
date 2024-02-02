class Article {
  final String author;
  final String title;
  final String description;
  final String content;
  final String urlToImage;
  final String publishedAt;

  Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.urlToImage,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
