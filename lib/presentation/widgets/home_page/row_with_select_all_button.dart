import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class RowWithSeeAllButton extends StatelessWidget {
  const RowWithSeeAllButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Latest News',
              style: ConstantsTextStyle.tsNewYorkSmall18,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Row(
                children: [
                  Text(
                    'See All',
                    style: ConstantsTextStyle.tsNunitoLight12Blue,
                  ),
                  SizedBox(width: 16),
                  SvgPicture.asset(
                    Svgs.forwardArrow,
                    height: 12,
                    width: 9.85,
                    fit: BoxFit.contain,
                    color: ConstantsColor.kSecondary,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routs.SEE_ALL,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
