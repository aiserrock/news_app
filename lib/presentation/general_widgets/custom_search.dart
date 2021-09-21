import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ConstantsColor.kSearchBorder, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 32,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.pushNamed(context, Routs.SEARCH),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Text(
                  'Dogecoin to the Moon...',
                  style: ConstantsTextStyle.tsNunitoSemiBold12Search,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: SvgPicture.asset(Svgs.search),
            )
          ],
        ),
      ),
    );
  }
}
