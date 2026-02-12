import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color border;
  final Color main;
  final Color text;
  final Color hint;
  final Color selection;
  final Color shadowColors;
  final Color optional1;
  final Color optional2;
  final Color optional3;
  final Color optionalColor4;
  final Color splashTransparent;
  final Color hoverTransparent;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.border,
    required this.main,
    required this.text,
    required this.hint,
    required this.selection,
    required this.optional1,
    required this.optional2,
    required this.optional3,
    required this.splashTransparent,
    required this.hoverTransparent,
    required this.shadowColors,
    required this.optionalColor4,
  });

  // copyWith برای تغییر تدریجی
  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? border,
    Color? main,
    Color? text,
    Color? hint,
    Color? selection,
    Color? shadowColors,
    Color? optional1,
    Color? optional2,
    Color? optional3,
    Color? splashTransparent,
    Color? hoverTransparent,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      border: border ?? this.border,
      main: main ?? this.main,
      text: text ?? this.text,
      hint: hint ?? this.hint,
      selection: selection ?? this.selection,
      optional1: optional1 ?? this.optional1,
      optional2: optional2 ?? this.optional2,
      optional3: optional3 ?? this.optional3,
      splashTransparent: splashTransparent ?? this.splashTransparent,
      hoverTransparent: hoverTransparent ?? this.hoverTransparent,
      shadowColors: shadowColors ?? this.shadowColors,
      optionalColor4: optionalColor4,
    );
  }

  // lerp برای انیمیت تغییر تم
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      main: Color.lerp(main, other.main, t)!,
      text: Color.lerp(text, other.text, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
      selection: Color.lerp(selection, other.selection, t)!,
      optional1: Color.lerp(optional1, other.optional1, t)!,
      optional2: Color.lerp(optional2, other.optional2, t)!,
      optional3: Color.lerp(optional3, other.optional3, t)!,
      splashTransparent: Color.lerp(
        splashTransparent,
        other.splashTransparent,
        t,
      )!,
      hoverTransparent: Color.lerp(
        hoverTransparent,
        other.hoverTransparent,
        t,
      )!,
      shadowColors: Color.lerp(shadowColors, other.selection, t)!,
      optionalColor4: Color.lerp(optionalColor4, other.selection, t)!,
    );
  }
}
