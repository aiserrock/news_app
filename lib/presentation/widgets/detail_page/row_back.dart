import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class RowBack extends StatelessWidget {
  const RowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 15),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ConstantsColor.kOpacity50Gray,
              ),
              height: 32,
              width: 32,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  Svgs.cupertinoRowBack,
                  height: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
