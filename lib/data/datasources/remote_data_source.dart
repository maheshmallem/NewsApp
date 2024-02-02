import 'package:news_app_task/data/models/artical_model.dart';

abstract class DataSource {
  Future<List<ArticleModel>> getLatestArticles(String query);

  Future<List<ArticleModel>> getInterests(String query);
}
