import 'package:flutter/material.dart';

const MaterialColor myColor = MaterialColor(0xFF134E57, <int, Color>{
  50: Color(0xFFE6ECED),
  100: Color(0xFFBFD0D3),
  200: Color(0xFF95B1B5),
  300: Color(0xFF6B9297),
  400: Color(0xFF4B7A81),
  500: Color(0xFF2B636B), //warna tombol add
  600: Color(0xFF265B63),
  700: Color(0xFF205158),
  800: Color(0xFF1A474E),
  900: Color(0xFF10353C),
});

ThemeData light = ThemeData(
  fontFamily: 'NunitoRE',
  brightness: Brightness.light,
  primarySwatch: myColor,
  textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0xff010101))),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xfffafafa)),
    backgroundColor: Color(0xFF134E57),
    titleSpacing: 0,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 18,
      fontFamily: "NunitoBL",
    ),
  ),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(Color(0xFF134E57))),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFD7BA46),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.yellowAccent,
        ),
      ),
    ),
  ),
);

ThemeData dark = ThemeData(
  fontFamily: 'NunitoRE',
  brightness: Brightness.dark,
  hintColor: const Color(0xb3ffffff),
  focusColor: const Color(0xb3ffffff),
  textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0xfffafafa))),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: Color(0xfffafafa)),
    backgroundColor: Color(0xFF222222),
    titleSpacing: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 18,
      fontFamily: "NunitoBL",
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xfffafafa),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF134E57),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: Colors.yellowAccent,
        ),
      ),
    ),
  ),
);

ThemeData orange = ThemeData(
  fontFamily: 'NunitoRE',
  brightness: Brightness.light,
  primarySwatch: Colors.orange,
  textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0xff010101))),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xfffafafa)),
    backgroundColor: Colors.orange,
    titleSpacing: 0,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 18,
      fontFamily: "NunitoBL",
    ),
  ),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(Colors.orange)),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.orange,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.orange,
        ),
      ),
    ),
  ),
);

ThemeData green = ThemeData(
  fontFamily: 'NunitoRE',
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0xff010101))),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xfffafafa)),
    backgroundColor: Colors.green,
    titleSpacing: 0,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 18,
      fontFamily: "NunitoBL",
    ),
  ),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(Colors.green)),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.green,
        ),
      ),
    ),
  ),
);

ThemeData red = ThemeData(
  fontFamily: 'NunitoRE',
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0xff010101))),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xfffafafa)),
    backgroundColor: Colors.red,
    titleSpacing: 0,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 18,
      fontFamily: "NunitoBL",
    ),
  ),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(Colors.red)),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  ),
);

ThemeData purple = ThemeData(
  fontFamily: 'NunitoRE',
  brightness: Brightness.light,
  textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0xff010101))),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xfffafafa)),
    backgroundColor: Colors.purple,
    titleSpacing: 0,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 18,
      fontFamily: "NunitoBL",
    ),
  ),
  colorSchemeSeed: Colors.purple,
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(Colors.purple)),
  // buttonTheme: const ButtonThemeData(
  //   buttonColor: Colors.purple,
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     foregroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //       side: const BorderSide(
  //         color: Colors.purple,
  //       ),
  //     ),
  //   ),
  // ),
);
