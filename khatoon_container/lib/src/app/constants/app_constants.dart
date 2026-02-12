import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khatoon_shared/index.dart';


class AppConstants {
  AppConstants._(); // private ctor to prevent instantiation

  /// یک InputDecoration پیش‌فرض که می‌توان آن را reuse کرد.
  /// (اگر لازم شد کپی‌برداری کن و label/text رو با copyWith تغییر بده)
  static const InputDecoration defaultInputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  );


  static BaseMasterDetailPagesOpenType isThisFormOrList(Object? args) {
    final BaseMasterDetailPagesOpenType def =
        BaseMasterDetailPagesOpenType.list;

    try {
      if (args == null) return def;

      // اگر مستقیم رشته بود (مثلاً "form" یا "list")
      if (args is String) {
        final BaseMasterDetailPagesOpenType? r = _checkFromString(args);
        return r ?? def;
      }

      // اگر Map دریافت کردیم (مثل RouteSettings.arguments)
      if (args is Map) {
        // تلاش کن کلید 'mode' یا معادل محلی را برداری
        final dynamic rawMode = args[StaticValues.pageModeKey] ?? args['mode'];
        if (rawMode is String) {
          final BaseMasterDetailPagesOpenType? r = _checkFromString(rawMode);
          return r ?? def;
        }
        // اگر مقدار mode خودِ map بود (مثلاً {'mode': {'value': 'form'}}) سعی کن stringify کنی
        if (rawMode != null) {
          final BaseMasterDetailPagesOpenType? r = _checkFromString(
            rawMode.toString(),
          );
          return r ?? def;
        }

        // گاهی کل Map به‌صورت Map<String,String> ارسال میشه و mode در values قرار داره
        if (args is Map<String, String> &&
            args.containsKey(StaticValues.pageModeKey)) {
          final BaseMasterDetailPagesOpenType? r = _checkFromString(
            args[StaticValues.pageModeKey]!,
          );
          return r ?? def;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        // فقط در حالت debug چاپ می‌کنیم تا در production نویزی ایجاد نشود
        debugPrint('isThisFormOrList parse error: $e');
      }
    }

    return def;
  }

  static BaseMasterDetailPagesOpenType? _checkFromString(String value) {
    final String newValue = value.toLowerCase();
    if (newValue.contains(
      BaseMasterDetailPagesOpenType.list.name.toLowerCase(),
    )) {
      return BaseMasterDetailPagesOpenType.list;
    } else if (newValue.contains(
      BaseMasterDetailPagesOpenType.form.name.toLowerCase(),
    )) {
      return BaseMasterDetailPagesOpenType.form;
    }
    return null;
  }

  /// ساختار داده‌ای که معمولا برای ناوبری استفاده می‌کنیم تا وضعیت باز شدن صفحه را مشخص کند.
  static Map<String, String> arrangeOpeningMode(
    BaseMasterDetailPagesOpenType openMode,
  ) => <String, String>{StaticValues.pageModeKey: openMode.name};
}

/// ثابت‌های کلیدهای استفاده‌شده برای آرگومان‌ها (کلیدها را اینجا متمرکز کن)
class StaticValues {
  StaticValues._();

  static const String pageModeKey = 'mode';
  static const String pageActionModeKey = 'action_mode';
}

/// متن‌های ساکن (قابل محلی‌سازی — در آینده بهتر است از intl استفاده شود)
class StaticText {
  StaticText._();

  static const String saveInvoice = 'ذخیره صورتحساب';
  static const String next = 'بعدی';
  static const String previous = 'قبلی';
  static const String page = 'صفحه';
  static const String of = 'از';
}

/// آیکون‌های ساکن (استفاده‌شده به‌صورت const تا دوباره ساخته نشوند)
class StaticIcons {
  StaticIcons._();

  static const Icon save = Icon(Icons.save_alt_outlined);
  static const Icon back = Icon(Icons.arrow_back_outlined);
  static const Icon next = Icon(Icons.arrow_forward_outlined);
}
