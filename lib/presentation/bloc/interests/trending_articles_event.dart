abstract class InterestsArticlesEvent {}

class FetchInterestsArticles extends InterestsArticlesEvent {
  final String query;
  final autoRefresh;

  FetchInterestsArticles({this.autoRefresh, required this.query});
}
