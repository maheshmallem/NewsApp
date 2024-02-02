abstract class LatestArticlesEvent {}

class FetchLatestArticles extends LatestArticlesEvent {
  final String query;
  final autoRefresh;

  FetchLatestArticles({this.autoRefresh, required this.query});
}
