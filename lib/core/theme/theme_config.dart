import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medhavi_app/core/constants/colors.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';

class ThemeConfigs {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Figtree',
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.backgroundPrimaryLight,
        errorColor: AppColors.negativeLight,
        brightness: Brightness.light,
        primarySwatch: AppColors.primarySwatchLight,
        accentColor: AppColors.accentLight,
        cardColor: AppColors.backgroundSecondaryLight,
      ),
      scaffoldBackgroundColor: AppColors.backgroundPrimaryLight,
      extensions: const [CustomThemeExtension.lightMode],
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundPrimaryLight,
        // titleTextStyle: TextStyle(
        //   fontSize: 18,
        //   fontWeight: FontWeight.w600,
        //   color: AppColors.contentPrimaryLight,
        // ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColors.contentPrimaryLight,
          size: 24.adaptSize,
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
          backgroundColor: AppColors.accentLight,
          foregroundColor: AppColors.backgroundInverserPrimaryLight,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: AppColors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.backgroundPrimaryLight,
        modalBackgroundColor: AppColors.backgroundPrimaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogBackgroundColor: AppColors.backgroundPrimaryLight,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentLight,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.borderOpaqueLight,
        tileColor: AppColors.backgroundPrimaryLight,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
        trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundPrimaryLight,
      ),
      textTheme: _textTheme(),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      /// Heading font for XX Large [displayLarge]
      displayLarge: TextStyle(
        fontSize: 40.fSize,
        fontWeight: FontWeight.w700,
      ),

      /// Heading font for X Large [displayMedium]
      displayMedium: TextStyle(
        fontSize: 44.fSize,
        fontWeight: FontWeight.w700,
      ),

      /// Heading font for Large [displaySmall]
      displaySmall: TextStyle(
        fontSize: 36.fSize,
        fontWeight: FontWeight.w700,
      ),

      /// Heading font for medium [headlineLarge]
      headlineLarge: TextStyle(
        fontSize: 36.fSize,
        fontWeight: FontWeight.w700,
      ),

      /// Heading font fot small [headlineMedium]
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.fSize,
      ),

      /// Heading font fot X small [headlineSmall]
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20.fSize,
      ),
      labelLarge: TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Figtree',
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.backgroundPrimaryDark,
        errorColor: AppColors.negativeDark,
        brightness: Brightness.dark,
        primarySwatch: AppColors.primarySwatchDark,
        accentColor: AppColors.accentDark,
        cardColor: AppColors.backgroundSecondaryDark,
      ),
      scaffoldBackgroundColor: AppColors.backgroundPrimaryDark,
      extensions: const [CustomThemeExtension.darkMode],
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundPrimaryDark,
        // titleTextStyle: TextStyle(
        //   fontSize: 18,
        //   fontWeight: FontWeight.w600,
        //   color: AppColors.contentPrimaryDark,
        // ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColors.contentPrimaryDark,
          size: 24.adaptSize,
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
          backgroundColor: AppColors.accentDark,
          foregroundColor: AppColors.backgroundInverserPrimaryDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: AppColors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.backgroundPrimaryDark,
        modalBackgroundColor: AppColors.backgroundPrimaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogBackgroundColor: AppColors.backgroundPrimaryDark,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentDark,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.borderOpaqueDark,
        tileColor: AppColors.backgroundPrimaryDark,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
        trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundPrimaryDark,
      ),
      textTheme: _textTheme(),
    );
  }
}
