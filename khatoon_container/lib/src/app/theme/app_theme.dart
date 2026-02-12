import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';

class AppTheme {
  final ThemeMode themeMode;
  final Color primaryColor;
  final Color secondaryColor;

  // final Color borderColor;
  final Color mainColor;

  // final ThemeData themeData;
  final Locale localMode;

  static ThemeData build(Color seedColor, Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    // رنگ‌های محاسبه‌شده (مثل قبلی)
    final Color smallOpaColors = isDark
        ? Colors.white54
        : Colors.grey.shade900;
    final Color borderColor = isDark ? Colors.white : Colors.grey.shade600;
    final Color shadowColors = isDark
        ? Colors.transparent
        : Colors.grey.shade600;
    final Color mainBackColors = isDark
        ? Colors.grey.shade900
        : const Color(0xF9FFFFFF);
    final Color textColor = isDark ? Colors.white54 : Colors.grey.shade900;
    final Color selectionColor = isDark ? Colors.lightBlue : Colors.lightGreen;
    final Color splashTr = Colors.transparent;
    final Color hoverTr = Colors.transparent;
    final Color optionalColor1 = Colors.lightGreen;
    final Color optionalColor2 = Colors.lightBlueAccent;
    final Color optionalColor3 = Colors.lightGreenAccent;
    final Color optionalColor4 = const Color(0xFFDDDDDD);

    // AppColors instance
    final AppColors appColors = AppColors(
      primary: seedColor,
      secondary: optionalColor1,
      border: borderColor,
      main: mainBackColors,
      text: textColor,
      hint: smallOpaColors,
      selection: selectionColor,
      optional1: optionalColor1,
      optional2: optionalColor2,
      optional3: optionalColor3,
      splashTransparent: splashTr,
      hoverTransparent: hoverTr,
      shadowColors: shadowColors,
        optionalColor4 :optionalColor4
    );

    final ThemeData base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: brightness,
      ),
      useMaterial3: true,
      fontFamily: 'Vazirani',
      scaffoldBackgroundColor: mainBackColors,
      shadowColor: shadowColors,
      focusColor: smallOpaColors,
      hintColor: smallOpaColors,
      hoverColor: hoverTr,
      splashColor: splashTr,
      // ... بقیه مقادیر قبلی‌ات
      brightness: brightness,
      // ...
    );

    // برمی‌گردونیم ThemeData با extension اضافه شده
    return base.copyWith(
      // اگر از copyWith برای برخی فیلدها استفاده می‌کنی اینجا بذار
      extensions: <ThemeExtension<dynamic>>[
        appColors, // مهم: اینجا AppColors را اضافه می‌کنیم
      ],
    );
  }


  AppTheme({
    this.themeMode = ThemeMode.light,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.green,
    this.localMode = const Locale('fa'),
    this.mainColor = const Color(0xFF212121),
  }) : super();

  factory AppTheme.dark() {
    return .new(
      themeMode: ThemeMode.dark,
      primaryColor: Colors.blue,
      secondaryColor: Colors.green,
      localMode: const Locale('fa'),
      mainColor: const Color(0xFF212121),
      // themeData: AppTheme.build(const Color(0xFF212121), Brightness.dark),
    );
  }

  factory AppTheme.light() {
    return .new(
      themeMode: ThemeMode.light,
      primaryColor: Colors.blue,
      secondaryColor: Colors.green,
      localMode: const Locale('fa'),
      mainColor: const Color(0xFF212121),
      // themeData: AppTheme.build(const Color(0xFF212121), Brightness.light),
    );
  }

  AppTheme copyWith({
    ThemeMode? themeMode,
    Color? primaryColor,
    Color? secondaryColor,
    Color? mainColor,
    Locale? localMode,
  }) {
    return AppTheme(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      mainColor: mainColor ?? this.mainColor,
      localMode: localMode ?? this.localMode,
      // themeData: build(primaryColor ?? this.primaryColor, Brightness.light),
    );
  }

  bool get isRtlByLocalize => (localMode.languageCode == 'fa');

  String get localeLanguageCode => localMode.languageCode;
}
