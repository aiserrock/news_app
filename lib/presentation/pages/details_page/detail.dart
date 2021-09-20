import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/widgets/detail_page/body.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.article}) : super(key: key);

  final Article article;
  @override
  Widget build(BuildContext context) {
    //final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      body: Body(article: article),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: ConstantsColor.kPrimary,
        onPressed: () {},
        child: SvgPicture.asset(Svgs.doubleHeart),
      ),
    );
  }
}
