import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class LinkedButtonWidget extends StatelessWidget {
  const LinkedButtonWidget({
    Key? key,
    required this.text,
    required this.pathToRoute,
  }) : super(key: key);
  final String text;
  final String pathToRoute;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              pathToRoute,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  text,
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
          ),
        ),
      ),
    );
  }
}
