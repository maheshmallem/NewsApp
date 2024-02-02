import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app_task/domain/entities/article.dart';
import 'package:news_app_task/domain/repositories/article_repository.dart';

import '../../core/errors/server_failure.dart';

class GetInterestArticles {
  final ArticleRepository repository;

  GetInterestArticles({required this.repository});

  Future<Either<Failure, List<Article>>> call(String query) async {
    return await repository.getInterests(query);
  }
}
