import 'package:get_it/get_it.dart';
import 'package:news_app_task/data/datasources/remote/remote_data_source_impl.dart';
import 'package:news_app_task/data/datasources/remote_data_source.dart';
import 'package:news_app_task/data/repositories/article_repository_impl.dart';
import 'package:news_app_task/domain/usecases/get_intrest_articles.dart';
import 'package:news_app_task/domain/usecases/get_latest_articles.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_bloc.dart';

import 'domain/repositories/article_repository.dart';
import 'package:http/http.dart' as http;

import 'presentation/bloc/interests/trending_articles_bloc.dart';

final getIt = GetIt.instance;

init() {
  // Bloc
  getIt.registerFactory(() => LatestArticlesBloc(getLatestArticles: getIt()));
  getIt.registerFactory(
      () => InterestsArticlesBloc(getInterestsArticles: getIt()));
  // getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  // getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetLatestArticles(repository: getIt()));
  getIt.registerLazySingleton(() => GetInterestArticles(repository: getIt()));
  // getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  // getIt.registerLazySingleton(() => SearchMovies(getIt()));

  getIt.registerLazySingleton<DataSource>(
      () => RemoteDataSourceImpl(client: getIt()));
  // Repositories
  getIt.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImp(remoteDataSource: getIt()));

  // Data sources

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
