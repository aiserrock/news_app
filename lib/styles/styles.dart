library styles;

import 'dart:ui';

import 'package:flutter/material.dart';

part 'colors.dart';

//for flutter height = line height / fontSize
class ConstantsTextStyle {
  static const tsNewYorkSmallSemibold16 = TextStyle(
    fontFamily: 'NewYork',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 20.8/16,
    color: Colors.white,
  );

  static const tsNewYorkSmall18 = TextStyle(
    fontFamily: 'NewYork',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 20.8/18,
  );

  static const tsNewYorkBold16 = TextStyle(
    fontFamily: 'NewYork',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 19.09/16,
  );

  static const tsNunitoLight12 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w300,
    fontSize: 12,
    height: 16.37/12,
  );

  static const tsNunitoLight12Blue = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 16.37/12,
    color: ConstantsColor.kSecondary,
  );

  static const tsNunitoLight10 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 13.64/10,
    color: Colors.white,
  );
  static const tsNunitoReguler14 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 19.1/14,
  );
  static const tsNunitoReguler10 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 10,
    height: 13.64/10,
    color: Colors.white,
  );
  static const tsNunitoSemiBold12 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 16.37/12,
  );
  static const tsNunitoSemiBold14 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 19.1/14,
  );
  static const tsNunitoBold12 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 16.37/12,
  );
  static const tsNunitoBold22 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 30.01/22,
  );
  static const tsNunitoExtraBold10 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 13.64/10,
  );
  static const tsNunitoExtraBold16 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 21.82/16,
  );
  static const tsNunitoBlack16 = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w900,
    fontSize: 14,
    height: 19.1/14,
  );
  static const tsSfProSemibold17 = TextStyle(
    fontFamily: 'SfPro',
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 22/17,
    letterSpacing: -0.41,
  );

  final Shader linearGradient = LinearGradient(
    colors:[Color(0xffFF3A44), Color(0xffFF8086)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
