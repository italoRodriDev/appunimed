import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

final ThemeData appThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.primary,
  secondaryHeaderColor: AppColor.secondary,
  scaffoldBackgroundColor: AppColor.background,
  useMaterial3: true,
  fontFamily: AppFont.UnimedSans,
  colorScheme: ColorScheme.light(
    primary: AppColor.background,
    onPrimary: AppColor.primary,
    secondary: AppColor.secondary,
    onSecondary: AppColor.secondary,
    surface: AppColor.background,
    onSurface: AppColor.dark,
    error: AppColor.danger,
    onError: AppColor.light,
  ),
  dividerColor: AppColor.medium,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontFamily: AppFont.UnimedSans,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 36.0,
      fontFamily: AppFont.UnimedSans,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: AppFont.UnimedSans),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.primary, // cor da statusbar
      statusBarIconBrightness: Brightness.dark, // ícones brancos
      statusBarBrightness: Brightness.light, // iOS
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColor.primary),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.secondary;
      } else {
        return Colors.black;
      }
    }),
  ),

  // ===== Tema para botões =====
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 18, // tamanho da fonte
        fontWeight: FontWeight.bold,
        fontFamily: AppFont.UnimedSans,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16, fontFamily: AppFont.UnimedSans),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16, fontFamily: AppFont.UnimedSans),
    ),
  ),
);
