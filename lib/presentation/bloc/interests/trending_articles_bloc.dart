import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/domain/usecases/get_intrest_articles.dart';

import 'trending_articles_event.dart';
import 'trending_articles_state.dart';

class InterestsArticlesBloc
    extends Bloc<InterestsArticlesEvent, InterestsArticlesState> {
  final GetInterestArticles getInterestsArticles;

  InterestsArticlesBloc({required this.getInterestsArticles})
      : super(InterestsArticlesInitial()) {
    on<FetchInterestsArticles>((event, emit) async {
      emit(InterestsArticlesLoading());

      final failureOrArticles = await getInterestsArticles(event.query);
      failureOrArticles.fold(
          (failure) => emit(InterestsArticlesError(failure.toString())),
          (article) => emit(InterestsArticlesLoaded(article)));
    });
  }
  @override
  Future<void> close() {
    return super.close();
  }
}
