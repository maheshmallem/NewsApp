import '../../../domain/entities/article.dart';

abstract class InterestsArticlesState {}

class InterestsArticlesInitial extends InterestsArticlesState {}

class InterestsArticlesLoading extends InterestsArticlesState {}

class InterestsArticlesLoaded extends InterestsArticlesState {
  
  final List<Article> articles;
  InterestsArticlesLoaded(this.articles);
}

class InterestsArticlesError extends InterestsArticlesState {
  final String message;
  InterestsArticlesError(this.message);
}
