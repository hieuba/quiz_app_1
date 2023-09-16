// func override nút back
import 'package:flutter/material.dart';
import 'package:quiz_app/components/show_dialog_custom.dart';

Future<bool> onWillPop(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => DialogCustom(
            done: () {
              Navigator.of(context).popAndPushNamed('/');
            },
            cancle: () {
              Navigator.of(context).pop();
            },
            title: 'Thông báo',
            content: 'Bạn có muốn thoát không?'),
      )) ??
      false;
}
