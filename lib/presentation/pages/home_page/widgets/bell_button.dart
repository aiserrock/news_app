import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class BellButton extends StatelessWidget {
  const BellButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {},
      icon: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ConstantsColor.kPrimary,
        ),
        child: SvgPicture.asset(
          Svgs.bell,
          height: 16,
          width: 13,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
