import 'package:flutter/material.dart';
import 'package:news_app/presentation/general_widgets/custom_search.dart';

import 'bell_button.dart';

class SearchWithBell extends StatelessWidget {
  const SearchWithBell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(child: CustomSearch()),
              SizedBox(width: 16),
              BellButton(),
            ],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}