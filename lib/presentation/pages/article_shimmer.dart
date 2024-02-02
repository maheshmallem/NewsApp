import 'package:flutter/material.dart';

class ArticleListShimmer extends StatelessWidget {
  const ArticleListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => ListTile(
          leading: Container(
            height: width * 0.2,
            width: 100,
            color: Colors.grey[300],
          ),
          title: Container(
            height: 15,
            color: Colors.grey[300],
          ),
          subtitle: Container(
            height: 15,
            color: Colors.grey[300],
          )),
      itemCount: 10,
    );
  }
}
