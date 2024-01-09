import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medhavi_app/core/constants/colors.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';

class ThemeConfigs {
  static ThemeData lightTheme() {
    return ThemeData(
      // fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.backgroundLight,
        errorColor: Colors.red.shade700,
        brightness: Brightness.light,
        primarySwatch: AppColors.primaryMapColor,
        accentColor: AppColors.secondaryLight,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      extensions: const [
        CustomThemeExtension.lightMode,
      ],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      hintColor: Colors.grey.shade500,
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.backgroundLight,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.backgroundLight,
        modalBackgroundColor: AppColors.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogBackgroundColor: AppColors.backgroundLight,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.greyDark,
        tileColor: AppColors.backgroundLight,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
        trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundLight,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      // fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.backgroundDark,
        errorColor: Colors.red,
        brightness: Brightness.dark,
        primarySwatch: AppColors.primaryDarkMapColor,
        accentColor: AppColors.secondaryDark,
      ),
      // backgroundColor: AppColors.backgroundDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      extensions: const [
        CustomThemeExtension.darkMode,
      ],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      hintColor: Colors.grey.shade50,
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.transparent,
            width: 2,
          ),
        ),
        unselectedLabelColor: AppColors.greyDark,
        labelColor: AppColors.greenDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenDark,
          foregroundColor: AppColors.backgroundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.greyBackground,
        modalBackgroundColor: AppColors.greyBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogBackgroundColor: AppColors.greyBackground,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.greyDark,
        tileColor: AppColors.backgroundDark,
        titleTextStyle: TextStyle(
          color: AppColors.backgroundDark,
          fontWeight: FontWeight.w600,
        ),
        subtitleTextStyle: TextStyle(
          color: AppColors.backgroundDark,
        ),
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(AppColors.greyDark),
        trackColor: MaterialStatePropertyAll(Color(0xFF344047)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
      ),
    );
  }
}
