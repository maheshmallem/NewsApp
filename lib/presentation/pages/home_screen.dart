import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_task/presentation/pages/intrest_over_time_screen.dart';
import 'package:news_app_task/presentation/pages/latest_articles_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHomeScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isHomeScreen ? 'Articles' : "Interests"),
        ),
        floatingActionButton: Container(
          color: Colors.yellow,
          child: TextButton(
              onPressed: () {
                setState(() {
                  isHomeScreen = !isHomeScreen;
                });
              },
              child: Text(isHomeScreen
                  ? 'Interests Over time >'
                  : 'Latest Articles >')),
        ),
        body: isHomeScreen ? LatestArticlesScreen() : InterestOverTimeScreen());
  }
}
