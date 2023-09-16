import 'package:flutter/material.dart';
import 'package:quiz_app/constants/theme_data.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.widget,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                'assets/icons/$icon',
                color: whiteColor,
              ),
            ),
            Center(
              child: widget,
            ),
          ],
        ),
        Positioned(
          child: Align(
              alignment: Alignment.center,
              child: Text(title, style: titleStyte)),
        ),
      ],
    );
  }
}
