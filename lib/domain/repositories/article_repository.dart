import 'package:dartz/dartz.dart';

import '../../core/errors/server_failure.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getLatestArticles(String query);
  Future<Either<Failure, List<Article>>> getLocalArticles(String query);
  Future<Either<Failure, List<Article>>> getInterests(String query);
}
