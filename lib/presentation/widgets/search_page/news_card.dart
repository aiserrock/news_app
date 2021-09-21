import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/convertrs/custom_date_time_converter.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/styles/styles.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.856,
          child: Stack(
            children: [
              CardBacking(article: article),
              CardGradient(),
              Content(article: article),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routs.DETAILS_FROM_HOME,
                      arguments: article,
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
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(article.title ?? '',
              style: ConstantsTextStyle.tsNewYorkSmallSemibold14White),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.author ?? 'Author not found',
                  style: ConstantsTextStyle.tsNunitoSemiBold12White,
                ),
              ),
              Text(
                CustomDateTimeConverter.stringFromDate(article.publishedAt),
                style: ConstantsTextStyle.tsNunitoSemiBold12White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardBacking extends StatelessWidget {
  const CardBacking({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      article.urlToImage ?? '',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width * 0.856,
      height: 128,
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