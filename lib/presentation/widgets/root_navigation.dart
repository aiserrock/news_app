import 'package:flutter/material.dart';
import 'package:news_app/presentation/pages/home_page/home.dart';

class RootNavigation extends StatefulWidget {
  const RootNavigation({Key? key}) : super(key: key);

  @override
  _RootNavigationState createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Home(),
        ),
        Positioned(
          bottom: 40,
          left: 28,
          right: 28,
          child: Material(
            child: Row(),
          ),
        ),
      ],
    );
  }
}
