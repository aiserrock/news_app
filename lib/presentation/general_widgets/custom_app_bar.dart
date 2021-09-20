import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 12.5, left: 13.5),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                Svgs.cupertinoRowBack,
                height: 15,
              ),

            ),
            Expanded(
              child: GradientText(
                'Hot Updates',
                textAlign: TextAlign.center,
                style: ConstantsTextStyle.tsSfProSemibold17,
                colors: [Color(0xffFF3A44), Color(0xffFF8086)],
              ),
            ),
            SizedBox(width: 64),
          ],
        ),
      ),
    );
  }
}
