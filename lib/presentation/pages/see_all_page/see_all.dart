import 'package:flutter/material.dart';
import 'package:news_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:news_app/presentation/widgets/see_all_page/body.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Body(articles: [],),
    );
  }
}
