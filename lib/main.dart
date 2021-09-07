import 'package:flutter/material.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/styles/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News presentation',
      theme: theme(),
      routes: routes,
      initialRoute: Routs.ROOT,
    );
  }
}
