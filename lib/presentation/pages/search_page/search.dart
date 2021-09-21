import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:news_app/resources/resources.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleWidget: _SearchPageWidget()),
      body: Column(
        children: [SizedBox(height: 16), _FilterCarousel()],
      ),
    );
  }
}

class _FilterCarousel extends StatelessWidget {
  _FilterCarousel({
    Key? key, this.onTabSelected,
  }) : super(key: key);
  final ValueChanged<int>? onTabSelected;

  final List<String> items = [
    'buisness',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> chipItems = List.generate(items.length, (int index) {
      return _buildChipItem(
        item: items[index],
        index: index,
      );
    });
    return Row(
      children: [Container()],
    );
  }
}

Widget _buildChipItem({
  required int index,
  ValueChanged<int>? onPressed,
  required String item,
}) {
  Color color = currentIndex == index ? selectedColor : unselectedColor;
  return Expanded(
    child: SizedBox(
      height: height,
      child: IconButton(
        onPressed: () => onPressed(index),
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              items[index].pathToIcon,
              color: color,
              height: iconSize,
              width: iconSize,
            ),
            Text(
              item.label,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    ),
  );
}

class _SearchPageWidget extends StatelessWidget {
  _SearchPageWidget({
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
