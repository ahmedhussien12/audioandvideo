import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xff284243);

  static ThemeData get light => ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(primary.value, {
          50: primary.withOpacity(.1),
          100: primary.withOpacity(.2),
          200: primary.withOpacity(.3),
          300: primary.withOpacity(.4),
          400: primary.withOpacity(.5),
          500: primary.withOpacity(.6),
          600: primary.withOpacity(.7),
          700: primary.withOpacity(.8),
          800: primary.withOpacity(.9),
          900: primary
        }),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          surfaceTintColor: Colors.transparent),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffACACAC).withOpacity(.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          fixedSize: Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            // color: Theme.of(context).primaryColor
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.3),
      ),
      switchTheme:
          SwitchThemeData(trackColor: WidgetStateProperty.resolveWith((states) {
        if (!states.contains(WidgetState.selected)) {
          return Color(0xffC0C0C0);
        }
        return primary;
      })));
}
