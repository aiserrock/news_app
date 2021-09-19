import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/entities/convertrs/custom_date_time_converter.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/widgets/detail_page/row_back.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final image = article.urlToImage != null
        ? Image.network(
            article.urlToImage!,
            fit: BoxFit.cover,
          )
        : SizedBox.shrink();
    return Stack(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 375 / 400,
                  child: image,
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.4394),
                  child: _ContentRoundedContainer(article: article),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.363),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Flexible(fit: FlexFit.tight,child: _HeaderRoundedContainer(article: article))),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 48,
          right: 15,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: ConstantsColor.kPrimary,
            onPressed: () {},
            child: SvgPicture.asset(Svgs.doubleHeart),
          ),
        ),
        Positioned(child: RowBack()),
      ],
    );
  }
}

class _ContentRoundedContainer extends StatelessWidget {
  const _ContentRoundedContainer({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 88),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              article.content!,
              style: ConstantsTextStyle.tsNunitoSemiBold14,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRoundedContainer extends StatelessWidget {
  const _HeaderRoundedContainer({Key? key, required this.article})
      : super(key: key);
  final Article article;

  //NEED BLUR
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantsColor.kOpacity50Gray,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CustomDateTimeConverter.stringFromDate(article.publishedAt),
                  style: ConstantsTextStyle.tsNunitoBold12,
                ),
                SizedBox(height: 8),
                Text(
                  article.title ?? 'No title',
                  style: ConstantsTextStyle.tsNewYorkBold16,
                ),
                SizedBox(height: 8),
                Text(
                  'Published by ${article.author ?? ''}',
                  style: ConstantsTextStyle.tsNunitoExtraBold10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
