import 'package:flutter/material.dart';

// colors
class DefeeColors {
  static const blue = Color(0xff002686);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const lightBlue = Color(0xff85A0E4);
  static const grey = Color(0xffBABABA);
  static const surfaceContainerGrey = Color(0xff646464);
  static const blackopacity = Color(0x44000000);
  static const red = Color(0xffFF0000);
}

// sizes
class DefeeThemeSizes {
  // Border radius constants
  static const double borderRadiusValue = 20.0;
  static BorderRadiusGeometry get borderRadius =>
      BorderRadius.circular(borderRadiusValue);
  static Radius get radius => Radius.circular(borderRadiusValue);
  static BorderRadiusGeometry get primaryBorderRadius =>
      BorderRadius.circular(borderRadiusValue / 2);

  // Padding constants
  static const double padding = 8.0;
  static EdgeInsets get thinPadding => EdgeInsets.all(padding);
  static EdgeInsets get thickPadding => EdgeInsets.all(padding * 2);

  // Margin constants
  static const double margin = 8.0;
  static EdgeInsets get marginInsets => EdgeInsets.all(margin);
}

// text styles
class DefeeTextStyles {
  static const TextStyle bodyTiny = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 10,
    color: DefeeColors.black,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeColors.black,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    color: DefeeColors.black,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 22,
    color: DefeeColors.black,
  );

  static const TextStyle onPrimarySmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    color: DefeeColors.white,
  );

  static const TextStyle onPrimaryMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20,
    color: DefeeColors.white,
  );

  static const TextStyle onPrimaryLarge = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 22,
    color: DefeeColors.white,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: DefeeColors.blue,
  );

  static const TextStyle menuMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20,
    color: DefeeColors.black,
  );

  static const TextStyle hint = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    color: DefeeColors.grey,
  );

  static const TextStyle hintSmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeColors.surfaceContainerGrey,
  );
}

// themes
class AppTheme {
  static ThemeData lightTheme = themeData(lightColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: TextTheme(
        bodySmall: DefeeTextStyles.bodySmall,
        bodyMedium: DefeeTextStyles.bodyMedium,
        bodyLarge: DefeeTextStyles.bodyLarge,
        titleMedium: DefeeTextStyles.titleMedium,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        titleTextStyle: DefeeTextStyles.titleMedium,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        splashColor: colorScheme.primary,
        hoverColor: colorScheme.primary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: DefeeThemeSizes.radius,
          ),
        ),
        modalBackgroundColor: colorScheme.surface,
        modalBarrierColor: colorScheme.surfaceDim,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: DefeeThemeSizes.borderRadius,
        ),
        barrierColor: colorScheme.surfaceDim,
        backgroundColor: colorScheme.surface,
        titleTextStyle: DefeeTextStyles.bodyMedium,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          overlayColor: colorScheme.secondary,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

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

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: DefeeColors.blue,
    onPrimary: DefeeColors.white,
    secondary: DefeeColors.lightBlue,
    onSecondary: DefeeColors.white,
    secondaryContainer: DefeeColors.grey,
    onSecondaryContainer: DefeeColors.white,
    surface: DefeeColors.white,
    surfaceContainer: DefeeColors.surfaceContainerGrey,
    onSurface: DefeeColors.black,
    onSurfaceVariant: DefeeColors.grey,
    error: DefeeColors.red,
    onError: DefeeColors.white,
    surfaceDim: DefeeColors.blackopacity,
    brightness: Brightness.light,
  );
}
