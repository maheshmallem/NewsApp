import 'package:dartz/dartz.dart';
import 'package:news_app_task/core/errors/server_failure.dart';
import 'package:news_app_task/data/datasources/local/local_data_source_impl.dart';
import 'package:news_app_task/data/datasources/remote/remote_data_source_impl.dart';
import 'package:news_app_task/data/datasources/remote_data_source.dart';
import 'package:news_app_task/data/models/artical_model.dart';
import 'package:news_app_task/domain/entities/article.dart';
import 'package:news_app_task/domain/repositories/article_repository.dart';

class ArticleRepositoryImp extends ArticleRepository {
  final DataSource remoteDataSource;

  ArticleRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Article>>> getLatestArticles(String query) async {
    try {
      final List<ArticleModel> movieModels =
          await remoteDataSource.getLatestArticles(query);
      final List<Article> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getLocalArticles(String query) async {
    var datasource = LocalDataSourceImpl();
    try {
      final List<ArticleModel> movieModels =
          await remoteDataSource.getLatestArticles(query);
      final List<Article> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getInterests(String query) async {
    try {
      final List<ArticleModel> movieModels =
          await remoteDataSource.getInterests(query);
      final List<Article> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
