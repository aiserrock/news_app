import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/widgets/detail_page/body.dart';
import 'package:news_app/presentation/widgets/detail_page/row_back.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      body: Body(article: article),
    );
  }
}
