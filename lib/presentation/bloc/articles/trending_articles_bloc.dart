import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/domain/usecases/get_latest_articles.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_event.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_state.dart';

class LatestArticlesBloc
    extends Bloc<LatestArticlesEvent, LatestArticlesState> {
  final GetLatestArticles getLatestArticles;



  LatestArticlesBloc({required this.getLatestArticles})
      : super(LatestArticlesInitial()) {
    on<FetchLatestArticles>((event, emit) async {
      emit(LatestArticlesLoading());

      final failureOrArticles = await getLatestArticles(event.query);
      failureOrArticles.fold(
          (failure) => emit(LatestArticlesError(failure.toString())),
          (article) => emit(LatestArticlesLoaded(article)));
    });
  }
  @override
  Future<void> close() {

    return super.close();
  }
}
