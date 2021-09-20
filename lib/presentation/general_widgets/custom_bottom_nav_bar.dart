import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem {
  final String pathToIcon;
  final String label;

  BottomBarItem({required this.pathToIcon, required this.label});
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color unselectedColor;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  CustomBottomNavBar({
    Key? key,
    required this.items,
    required this.height,
    required this.iconSize,
    required this.backgroundColor,
    required this.unselectedColor,
    required this.selectedColor,
    required this.onTabSelected,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> barItems = List.generate(items.length, (int index) {
      return _buildTabItem(
        item: items[index],
        index: index,
        onPressed: onTabSelected,
      );
    });
    return Material(
      color: backgroundColor,
      child: Column(
        children: [
          SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 4,
              width: 32,
              color: Color(0xFFE0E0E0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: barItems,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required ValueChanged<int> onPressed,
    required BottomBarItem item,
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
}
