import 'package:flutter/material.dart';
import 'package:news_app/data/helpers/error_image.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/styles/styles.dart';

class LatestNewsCards extends StatelessWidget {
  const LatestNewsCards({
    Key? key,
    required this.articles,
    required this.index,
  }) : super(key: key);

  final List<Article> articles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.856,
          child: Stack(
            children: [
              CardBacking(articles: articles, index: index),
              CardGradient(),
              Content(articles: articles, index: index),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routs.DETAILS_FROM_HOME,
                      arguments: articles[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.articles,
    required this.index,
  }) : super(key: key);

  final List<Article> articles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 60,
        right: 8,
        left: 8,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'by ${articles[index].author}',
            style: ConstantsTextStyle.tsNunitoReguler10,
          ),
          Text(articles[index].title ?? '',
              style: ConstantsTextStyle.tsNewYorkSmallSemibold16),
          SizedBox(height: 32),
          Text(
            articles[index].description ?? '',
            style: ConstantsTextStyle.tsNunitoLight10,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class CardBacking extends StatelessWidget {
  const CardBacking({
    Key? key,
    required this.articles,
    required this.index,
  }) : super(key: key);

  final List<Article> articles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      articles[index].urlToImage ?? '',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width * 0.856,
      height: 240,
      errorBuilder: (context, error, stackTrace) {
        return errorImage(context);
      },
    );
  }
}

class CardGradient extends StatelessWidget {
  const CardGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // from bottom to center
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          // from black to transparent black
          colors: [
            Color.fromRGBO(0, 0, 0, 1),
            Color.fromRGBO(98, 98, 98, 0.35),
          ],
        ),
      ),
    );
  }
}
