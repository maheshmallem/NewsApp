import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_bloc.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_state.dart';
import 'package:news_app_task/presentation/pages/intrest_over_time_screen.dart';

import '../bloc/articles/trending_articles_event.dart';
import '../bloc/interests/trending_articles_bloc.dart';
import '../bloc/interests/trending_articles_state.dart';
import 'articles_list.dart';
import 'article_shimmer.dart';
import 'interest_graph.dart';

class LatestArticlesScreen extends StatefulWidget {
  LatestArticlesScreen({super.key});

  @override
  State<LatestArticlesScreen> createState() => _LatestArticlesScreenState();
}

class _LatestArticlesScreenState extends State<LatestArticlesScreen> {
  final searchController = TextEditingController();
  var autoRefresh = false;
  var isHomeScreen = false;
  late Timer periodicTimer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: const OutlineInputBorder(),
                  )),
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ))),
                  onPressed: () {
                    searchHandler(searchController.text, context);
                  },
                  child: const Text('Search')),
            ),
            Column(
              children: [
                Switch(
                    value: autoRefresh,
                    onChanged: (val) {
                      setState(() {
                        autoRefresh = val;
                      });

                      if (val == true) {
                        searchHandler(searchController.text, context);
                      } else {
                        try {
                          periodicTimer.cancel();
                        } catch (ex) {}
                      }
                    }),
                const Text(
                  'Auto Refresh',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
        Expanded(
          child: BlocBuilder<LatestArticlesBloc, LatestArticlesState>(
            builder: (context, state) {
              print('-----------------');
              print(state);
              if (state is LatestArticlesLoading) {
                return const ArticleListShimmer();
              } else if (state is LatestArticlesLoaded) {
                return ArticlesList(article: state.articles);
              } else if (state is LatestArticlesError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ),
      ]),
    );
  }

  void searchHandler(String text, BuildContext context) {
    print('Search Text :$text');

    if (autoRefresh) {
      periodicTimer =
          Timer.periodic(const Duration(seconds: 30), (Timer timer) {
        BlocProvider.of<LatestArticlesBloc>(context)
            .add(FetchLatestArticles(query: text));
      });
    } else {
      try {
        periodicTimer.cancel();
      } catch (ex) {}

      BlocProvider.of<LatestArticlesBloc>(context)
          .add(FetchLatestArticles(query: text));
    }
  }
}
