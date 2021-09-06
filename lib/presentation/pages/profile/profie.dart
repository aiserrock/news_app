import 'package:flutter/material.dart';
import 'package:news_app/presentation/general_widgets/custom_search.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomSearch()),
      ),
    );
  }
}
