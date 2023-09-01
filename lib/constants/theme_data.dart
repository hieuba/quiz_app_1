import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_app/constants/padding.dart';

class ThemeClass {
  Color lightPrimaryColor = HexColor('#3550DC');
  Color darkPrimaryColor = HexColor('#A68290');

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light()
          .copyWith(primary: _themeClass.lightPrimaryColor));

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();

var whiteColor = const Color(0xffffffff);
var grayColor = const Color(0xffd4d4d4);
var blueColor = const Color(0xff3550DC);
var blackColor = const Color(0xff333333);
var tabbarColor = const Color(0xff999999);
var errorColor = const Color(0xffeb3434);

var indexGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF3550DC),
    Color(0xFF27E9F7),
  ],
  stops: [0, 2],
);

var appBarGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF3550DC),
    Color(0xFF27E9F7),
  ],
);

var startQuizGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF3550DC),
    Color(0xFF27E9F7),
  ],
);

var textGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.5, 1],
  colors: [
    Color(0xFF3550DC),
    Color(0xFF27E9F7),
  ],
);

var titleStyte = GoogleFonts.ubuntu(
    fontSize: kTitleFontSize, fontWeight: FontWeight.w700, color: whiteColor);

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle textStyle;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style:
            textStyle.copyWith(color: Colors.white), // Set text color to white
      ),
    );
  }
}
