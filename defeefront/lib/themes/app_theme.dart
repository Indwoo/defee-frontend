import 'package:flutter/material.dart';

class DefeeThemeColors {
  static const Color primary = Color(0xff002686);
  static const Color secondary = Color(0xff85A0E4);
  static const Color background = Color(0xffffffff);
  static const Color disabled = Color(0xffBABABA);
  static const Color text = Color(0xff212121);
}

class DefeeThemeSizes {
  // Border radius constants
  static const double borderRadiusValue = 20.0;
  static BorderRadiusGeometry get borderRadius =>
      BorderRadius.circular(borderRadiusValue);
  static Radius get radius => Radius.circular(borderRadiusValue);

  // Padding constants
  static const double padding = 8.0;
  static EdgeInsets get thinPadding => EdgeInsets.all(padding);
  static EdgeInsets get thickPadding => EdgeInsets.all(padding * 2);

  // Margin constants
  static const double margin = 8.0;
  static EdgeInsets get marginInsets => EdgeInsets.all(margin);
}

class DefeeTextStyles {
  static const TextStyle bodySmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeThemeColors.text,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    color: DefeeThemeColors.text,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 22,
    color: DefeeThemeColors.text,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: DefeeThemeColors.primary,
  );
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodySmall: DefeeTextStyles.bodySmall,
      bodyMedium: DefeeTextStyles.bodyMedium,
      bodyLarge: DefeeTextStyles.bodyLarge,
      titleMedium: DefeeTextStyles.titleMedium,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: DefeeThemeColors.background,
      titleTextStyle: DefeeTextStyles.titleMedium,
    ),
    scaffoldBackgroundColor: DefeeThemeColors.background,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: DefeeThemeColors.secondary,
      splashColor: DefeeThemeColors.primary,
      hoverColor: DefeeThemeColors.primary,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: DefeeThemeSizes.radius,
        ),
      ),
      modalBackgroundColor: DefeeThemeColors.background,
      modalBarrierColor: Colors.black.withOpacity(0.5),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: DefeeThemeSizes.borderRadius,
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: DefeeThemeColors.background,
      titleTextStyle: DefeeTextStyles.bodyMedium,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: DefeeThemeColors.text,
        overlayColor: DefeeThemeColors.secondary,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 14,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 18,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );
}
