import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/colors.dart';

class myThemeData {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor:AppColors.secondary,
   // cardColor:Colors.white.withOpacity(0.7),
    appBarTheme: AppBarTheme(
        color: AppColors.secondary,
       // elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.primary,
          size: 30,
        ),
        //shadowColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle:
        GoogleFonts.elMessiri(
          color: Colors.white
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey,

    ),
    // dividerTheme: DividerThemeData(
    //   color: AppColors.primary,
    //   thickness: 3,
    // ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        color: AppColors.secondary,
      ),
      bodySmall: GoogleFonts.elMessiri(
        color: Colors.white
      ),),
    //     ,
    //     fontWeight: FontWeight.normal,
    //     fontSize: 20,
    //   ),
    // ),

  );
  static ThemeData darkTheme = ThemeData(
    //cardColor: AppColors.primaryDark.withOpacity(0.7),

    scaffoldBackgroundColor: AppColors.bottomDark,
    appBarTheme: AppBarTheme(
        color: AppColors.appBar,
        //elevation: 0,
        // iconTheme: IconThemeData(
        //   color: Colors.white,
        //   size: 30,
        // ),
        shadowColor: Colors.transparent,
        //centerTitle: true,
        titleTextStyle:
        GoogleFonts.elMessiri(
          color: Colors.black,

        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.bottomDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey,

    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        color: Color.fromRGBO(20, 25, 34, 1),
      ),
      bodySmall: GoogleFonts.elMessiri(
          color: Colors.black


    ),),
    // dividerTheme: DividerThemeData(
    //   color: AppColors.primary,
    //   thickness: 3,
    // ),
    // iconTheme: IconThemeData(size: 30, color: AppColors.primary),
    // textTheme: TextTheme(
    //   bodyLarge: GoogleFonts.elMessiri(
    //     color: Colors.white,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 30,
    //   ),
    //   bodyMedium: GoogleFonts.elMessiri(
    //     color: Colors.black,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 25,
    //   ),
    //   bodySmall: GoogleFonts.elMessiri(
    //     color: AppColors.primary,
    //     fontWeight: FontWeight.normal,
    //     fontSize: 20,
    //   ),
    //
    // ),
  );

}