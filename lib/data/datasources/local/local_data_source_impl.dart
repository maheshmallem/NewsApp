import 'dart:convert';

import 'package:news_app_task/data/datasources/remote_data_source.dart';
import 'package:news_app_task/data/models/artical_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/server_exception.dart';

class LocalDataSourceImpl extends DataSource {
  @override
  Future<List<ArticleModel>> getLatestArticles(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('latestData');

    print('Local Data source impl :${data}');
    if (data != null) {
      var jsonData = jsonDecode(data);
      final List<ArticleModel> articles = (jsonData['articles'] as List)
          .map((movie) => ArticleModel.fromJson(movie))
          .toList();

      return articles;
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<List<ArticleModel>> getInterests(String query) {
    // TODO: implement getInterests
    throw UnimplementedError();
  }
}
