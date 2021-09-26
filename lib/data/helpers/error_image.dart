import 'package:flutter/material.dart';
import 'package:news_app/resources/resources.dart';

Widget errorImage(BuildContext context) {
  return Image.asset(
    Images.imageNotFound,
    fit: BoxFit.cover,
    width: MediaQuery.of(context).size.width,
  );
}
