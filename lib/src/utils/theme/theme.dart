import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  Color lightPrimaryColor = HexColor('#1C5D99');
  Color darkPrimaryColor = HexColor('#BBCDE5');

  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: _themeClass.lightPrimaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(double.infinity, 45)),
            backgroundColor: MaterialStateProperty.all(_themeClass.lightPrimaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            foregroundColor: MaterialStateProperty.all(Colors.white)
        ),
      ),
      textTheme: TextTheme(
          displayLarge: const TextStyle(fontFamily: 'hammersmithOne', fontSize: 40),
          displayMedium: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 30, color: Colors.black),
          displaySmall: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 23, color: Colors.black),
          headlineMedium: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 27, color: Colors.black),
          headlineSmall: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 21, color: Colors.black),
          titleLarge: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 30, color: Colors.black),
          titleMedium: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 21, color: Colors.black),
          titleSmall: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 17, color: Colors.black),
          bodyLarge: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 21, color: Colors.black),
          bodyMedium: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
          bodySmall: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black),
          labelLarge: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 21, color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15),
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
  );

  // static ThemeData darkTheme = ThemeData(
  //     useMaterial3: true,
  //     colorScheme: const ColorScheme.light().copyWith(
  //       primary: _themeClass.lightPrimaryColor,
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ButtonStyle(
  //           minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 55)),
  //           backgroundColor: MaterialStateProperty.resolveWith<Color>(
  //                   (states) => _themeClass.lightPrimaryColor),
  //           shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
  //                 (_){
  //               return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  //             },
  //           ),
  //           textStyle: MaterialStateProperty.resolveWith(
  //                 (states) => GoogleFonts.poppins(
  //               fontWeight: states.contains(MaterialState.pressed)
  //                   ? FontWeight.bold
  //                   : FontWeight.normal,
  //               fontSize: 23.0,
  //             ),
  //           ),
  //           foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
  //       ),
  //     ),
  //     textTheme: TextTheme(
  //       displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 32),
  //       titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 24),
  //       bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 16),
  //       bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 14),
  //     ),
  //     scaffoldBackgroundColor: Colors.black
  // );
}

ThemeClass _themeClass = ThemeClass();
