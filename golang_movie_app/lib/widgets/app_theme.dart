import 'package:flutter/material.dart';

class AppTheme {
  // ThemeData appTheme() => ThemeData(
  //       brightness: Brightness.dark,
  //       primaryColor: const Color(0xff142133),
  //       iconTheme: const IconThemeData(color: Colors.amber),
  //       textTheme: TextTheme(
  //         bodyMedium: const TextStyle(
  //           color: Color(0xff778da9),
  //         ),
  //         bodyText1: const TextStyle(
  //           color: Color(0xff778da9),
  //         ),
  //         bodyText2: const TextStyle(
  //           color: Color(0xff778da9),
  //         ),
  //         bodySmall: const TextStyle(
  //           color: Color(0xff778da9),
  //         ),
  //         headline2: const TextStyle(
  //           color: Color(0xff778da9),
  //         ),
  //       ),
  //     );
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: const Color(0xff142133),
      iconTheme: const IconThemeData(color: Colors.amber),
      // textTheme: TextTheme(
      //   bodyMedium: const TextStyle(
      //     color: Color(0xff778da9),
      //   ),
      //   bodyText1: const TextStyle(
      //     color: Color(0xff778da9),
      //   ),
      //   bodyText2: const TextStyle(
      //     color: Color(0xff778da9),
      //   ),
      //   bodySmall: const TextStyle(
      //     color: Color(0xff778da9),
      //   ),
      //   headline2: const TextStyle(
      //     color: Color(0xff778da9),
      //   ),
      // ),
    );
  }
}
