import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/injection_container.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_bloc.dart';
import 'package:news_app_task/presentation/bloc/articles/trending_articles_event.dart';
import 'package:news_app_task/presentation/bloc/interests/trending_articles_bloc.dart';
import 'package:news_app_task/presentation/bloc/interests/trending_articles_event.dart';
import 'package:news_app_task/presentation/pages/home_screen.dart';
import 'presentation/pages/latest_articles_screen.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt<InterestsArticlesBloc>()
              ..add(FetchInterestsArticles(query: 'usa')),
          ),
          BlocProvider(
            create: (context) => getIt<LatestArticlesBloc>()
              ..add(FetchLatestArticles(query: 'usa')),
          ),
        ], child: HomeScreen()));
    ;
  }
}
