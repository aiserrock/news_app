import 'package:flutter/material.dart';
import 'package:news_app/data/constants.dart';
import 'package:news_app/styles/styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: const Color(0xFFF0F1FA),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal:16, vertical: 8),
        isCollapsed: true,
        hintText: 'Dogecoin to the Moon...',
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.search,
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight:40,
          maxWidth: 40,
        )
      ),
    );
  }
}
