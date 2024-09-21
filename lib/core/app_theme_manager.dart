import 'package:flutter/material.dart';

class appthememanager {
  static const Color primarycolor=Color(0xff5D9CEC);
  static const Color primaryDarkcolor=Color(0xff060E1E);

  static ThemeData lighttheme=ThemeData(
    primaryColor: primarycolor,
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff5D9CEC),
      titleTextStyle:TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      )

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: primarycolor,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC8C9CB),
        size: 30,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,


    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        fontFamily: "El Messiri",
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "poppians",
        color: Colors.black45,
      ),

    ),



  );
  static ThemeData darktheme=ThemeData(
    primaryColor: primaryDarkcolor,
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff141922),
        titleTextStyle:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "poppians",
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        )

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: primaryDarkcolor,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC8C9CB),
        size: 30,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,


    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        fontFamily: "El Messiri",
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: "poppians",
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "poppians",
        color: Colors.black45,
      ),

    ),



  );

}