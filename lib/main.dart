import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News presentation',
      theme: theme(),
      routes: routes,
      initialRoute: HOME,
    );
  }
}
