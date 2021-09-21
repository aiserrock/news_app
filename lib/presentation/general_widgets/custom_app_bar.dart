import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const kDefaultConstraints = BoxConstraints(
    minWidth: 20,
    maxWidth: 20,
    minHeight: 32,
    maxHeight: 32,
  );

  const CustomAppBar(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.toolbarHeight,
      this.title,
      this.titleStyle,
      this.titleWidget,
      this.centerTitle = true,
      this.actions,
      this.automaticallyImplyLeading = true,
      this.leading,
      this.backwardLeadingAction})
      : super(key: key);

  final Color? backgroundColor;
  final double? toolbarHeight;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? titleWidget;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;
  final Widget? leading;
  final VoidCallback? backwardLeadingAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      toolbarHeight: toolbarHeight,
      centerTitle: centerTitle,
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => Navigator.pop(context),
        constraints: kDefaultConstraints,
        icon: SvgPicture.asset(
          Svgs.cupertinoRowBack,
        ),
      ),
      title: titleWidget != null
          ? titleWidget
          : title != null
              ? GradientText(
                  title!,
                  textAlign: TextAlign.center,
                  style: ConstantsTextStyle.tsSfProSemibold17,
                  colors: [Color(0xffFF3A44), Color(0xffFF8086)],
                )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
