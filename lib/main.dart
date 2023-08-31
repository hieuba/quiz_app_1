import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/home_page.dart';
import 'package:quiz_app/screens/result/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
