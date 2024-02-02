import '../../../domain/entities/article.dart';

abstract class LatestArticlesState {}

class LatestArticlesInitial extends LatestArticlesState {}

class LatestArticlesLoading extends LatestArticlesState {}

class LatestArticlesLoaded extends LatestArticlesState {
  final List<Article> articles;

  LatestArticlesLoaded(this.articles);
}

class LatestArticlesError extends LatestArticlesState {
  final String message;
  LatestArticlesError(this.message);
}
