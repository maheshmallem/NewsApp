import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app_task/domain/entities/article.dart';
import 'package:news_app_task/domain/repositories/article_repository.dart';

import '../../core/errors/server_failure.dart';

class GetLatestArticles {
  final ArticleRepository repository;

  GetLatestArticles({required this.repository});

  Future<Either<Failure, List<Article>>> call(String query) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return await repository.getLatestArticles(query);
      }
    } on SocketException catch (_) {
      return await repository.getLocalArticles(query);
    }

    return await repository.getLatestArticles(query);
  }
}
