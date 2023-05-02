import 'package:clean_architecture_movies_app/core/style/constants/color_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: ColorConstants.kPrimaryColor,
      scaffoldBackgroundColor: ColorConstants.kPrimaryBackgroundColor,
      appBarTheme: appBarTheme,
      progressIndicatorTheme: progressIndicatorThemeData,
      iconTheme: iconThemeData,
      textTheme: textTheme,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: bottomNavigationBar,
      cardTheme: cardTheme,
      highlightColor: ColorConstants.kTransparentColor,
      splashColor: ColorConstants.kTransparentColor,
      expansionTileTheme: expansionTileTheme,
      brightness: Brightness.light,
      scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(false),
          thickness: MaterialStateProperty.all(4),
          thumbColor:
              MaterialStateProperty.all(ColorConstants.kPrimaryBackgroundColor),
          trackColor:
              MaterialStateProperty.all(ColorConstants.kSecondaryColorAccent),
          mainAxisMargin: 20,
          crossAxisMargin: 3));
}

ProgressIndicatorThemeData progressIndicatorThemeData =
    const ProgressIndicatorThemeData(
        color: ColorConstants.kSecondaryColorAccent);

IconThemeData iconThemeData =
    const IconThemeData(color: ColorConstants.kSecondaryColor);

AppBarTheme appBarTheme = const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: false,
    elevation: 0,
    backgroundColor: ColorConstants.kTransparentColor);

BottomNavigationBarThemeData bottomNavigationBar = BottomNavigationBarThemeData(
  backgroundColor: ColorConstants.kPrimaryBackgroundColor,
  selectedItemColor: ColorConstants.kSecondaryColor,
  unselectedItemColor: ColorConstants.kSecondaryColor,
  selectedIconTheme: const IconThemeData(color: ColorConstants.kPrimaryColor),
  showUnselectedLabels: true,
);

final CardTheme cardTheme = CardTheme(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(width: 1, color: ColorConstants.kSecondaryColor),
    ));

ExpansionTileThemeData expansionTileTheme = const ExpansionTileThemeData(
    collapsedIconColor: ColorConstants.kSecondaryColor);

TextTheme textTheme = const TextTheme()
    .apply(displayColor: Colors.white, bodyColor: Colors.white);

ColorScheme colorScheme = const ColorScheme.dark().copyWith(
  primary: ColorConstants.kPrimaryColor,
  secondary: ColorConstants.kPrimaryAccentColor,
  error: ColorConstants.kErrorColor,
);
