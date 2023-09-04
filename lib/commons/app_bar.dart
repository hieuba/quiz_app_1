import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                /*
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Thông báo'),
                        content: const Text('Bạn có muốn thoát không?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                              child: Text('Thoát',
                                  style: TextStyle(color: errorColor))),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Huỷ')),
                        ],
                      );
                    },
                  );
               */
                child: Image.asset('assets/icons/$icon'),
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
      ),
    );
  }
}
