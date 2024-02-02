import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';

class ArticlesList extends StatelessWidget {
  final List<Article> article;
  const ArticlesList({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              leading: Image.network(
                article[index].urlToImage,
                width: width * 0.2,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Text('');
                },
              ),
              title: Text(
                article[index].title,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              subtitle: Text(
                article[index].description,
                maxLines: 2,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: article.length);
  }
}
