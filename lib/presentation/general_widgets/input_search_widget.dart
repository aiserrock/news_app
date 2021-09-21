import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/resources/resources.dart';

class InputSearchWidget extends StatelessWidget {
  InputSearchWidget({
    Key? key,
  }) : super(key: key);
  final msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: msgController,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: const Color(0xFFF0F1FA),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        isCollapsed: true,
        hintText: 'Dogecoin to the Moon...',
        hintStyle: TextStyle(color: const Color(0xFFA6A6A6)),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 40,
          maxWidth: 44,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () => msgController.clear(),
            icon: SvgPicture.asset(
              Svgs.searchClear,
            ),
          ),
        ),
      ),
    );
  }
}