import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/convertrs/custom_date_time_converter.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/pages/details_page/widgets/row_back.dart';
import 'package:news_app/styles/styles.dart';
import 'package:news_app/data/extentions/power_string.dart';

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
                  padding: EdgeInsets.only(top: size.height * 0.48),
                  child: _ContentRoundedContainer(article: article),
                ),
                Positioned(
                  top: size.height * 0.373,
                  left: 32,
                  right: 32,
                  child: SizedBox(
                    height: 141,
                    child: _HeaderRoundedContainer(article: article),
                  ),
                ),
              ],
            ),
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
            child: setContent(),
          ),
        ],
      ),
    );
  }

  RichText setContent() {
    final RichText content;
    if (article.content != null) {
      var allText = article.content!.removeLast().removeFirst();
      var firstWord = article.content!.first();
      print(allText);
      print(firstWord);
      content = RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: firstWord,
              style: ConstantsTextStyle.tsNunitoBlack14,
            ),
            TextSpan(
              text: allText,
              style: ConstantsTextStyle.tsNunitoSemiBold14,
            ),
          ],
        ),
      );
    } else {
      content = RichText(
        text: const TextSpan(
          text: 'Content not found',
          style: ConstantsTextStyle.tsNunitoSemiBold14,
        ),
      );
    }
    return content;
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
        color: ConstantsColor.kOpacity70Gray,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CustomDateTimeConverter.stringFromDate(article.publishedAt),
              style: ConstantsTextStyle.tsNunitoBold12,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                article.title ?? 'No title',
                style: ConstantsTextStyle.tsNewYorkBold16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Published by ${article.author ?? ''}',
              style: ConstantsTextStyle.tsNunitoExtraBold10,
            ),
          ],
        ),
      ),
    );
  }
}
