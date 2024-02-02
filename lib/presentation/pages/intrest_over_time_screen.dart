import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/presentation/bloc/interests/trending_articles_event.dart';
import 'package:news_app_task/presentation/pages/interest_graph.dart';

import '../bloc/interests/trending_articles_bloc.dart';
import '../bloc/interests/trending_articles_state.dart';

class InterestOverTimeScreen extends StatelessWidget {
  InterestOverTimeScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          searchHandler(searchController.text, context);
                        },
                        icon: const Icon(Icons.search)),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ))),
                    onPressed: () {
                      print('Search clicked');
                      searchHandler(searchController.text, context);
                    },
                    child: const Text('Search')),
              ),
            ],
          ),
          BlocBuilder<InterestsArticlesBloc, InterestsArticlesState>(
            builder: (context, state) {
              print('-----------------');
              print(state);
              if (state is InterestsArticlesLoading) {
                return CircularProgressIndicator();
              } else if (state is InterestsArticlesLoaded) {
                print('Loaded Articles :${state.articles.length}');
                return InterestsGraph(articles: state.articles);
              } else if (state is InterestsArticlesError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  void searchHandler(String text, BuildContext context) {
    BlocProvider.of<InterestsArticlesBloc>(context)
        .add(FetchInterestsArticles(query: text));
  }
}
