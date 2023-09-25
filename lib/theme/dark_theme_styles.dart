import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      textTheme: TextTheme(
          headlineLarge: GoogleFonts.lexendDeca(
              color: isDarkTheme ? Colors.white : Colors.black),
          headlineMedium: GoogleFonts.lexendDeca(
            color: isDarkTheme ? Color(0xff04ECA6) : Color(0xffABAFD1),
          ),
          headlineSmall: GoogleFonts.lexendDeca(
              color: isDarkTheme ? Colors.white.withOpacity(.5) : Colors.black.withOpacity(.5)),
          ),
      colorScheme: ColorScheme.dark(
          background: isDarkTheme ? Color(0xff010005) : Color(0xffF1F5FB),
          brightness: isDarkTheme ? Brightness.dark : Brightness.light),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Colors.white : Colors.black,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
