import 'dart:convert';

import 'package:news_app_task/data/datasources/remote_data_source.dart';
import 'package:news_app_task/data/models/artical_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/server_exception.dart';

class RemoteDataSourceImpl extends DataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://newsapi.org/v2";
  static const API_KEY = "a1a5302e1a7e43739cabfc2106c56cdd";

  @override
  Future<List<ArticleModel>> getLatestArticles(String query) async {
    String url =
        "https://newsapi.org/v2/top-headlines?apiKey=a1a5302e1a7e43739cabfc2106c56cdd&country=us&q=$query&pageSize=10&page=1";
    print(url);
    final response = await client.get(
      Uri.parse(url),
    );
    print('remote Data source impl :${response.body}');
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('latestData', response.body);
      final responseBody = json.decode(response.body);

      final List<ArticleModel> articles = (responseBody['articles'] as List)
          .map((movie) => ArticleModel.fromJson(movie))
          .toList();

      return articles;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArticleModel>> getInterests(String query) async {
    String url =
        "https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=a1a5302e1a7e43739cabfc2106c56cdd";
    print(url);
    final response = await client.get(
      Uri.parse(url),
    );
    print('remote Data source impl :${response.body}');
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('latestData', response.body);
      final responseBody = json.decode(response.body);

      final List<ArticleModel> articles = (responseBody['articles'] as List)
          .map((movie) => ArticleModel.fromJson(movie))
          .toList();

      return articles;
    } else {
      throw ServerException();
    }
  }
}
