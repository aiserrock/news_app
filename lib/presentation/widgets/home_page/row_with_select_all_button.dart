import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/presentation/general_widgets/linked_button.dart';
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
          LinkedButtonWidget(
            text: 'See All',
            pathToRoute: Routs.SEE_ALL,
          ),
        ],
      ),
    );
  }
}
