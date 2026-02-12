import 'package:flutter/material.dart';
import 'package:khatoon_container/l10n/generated/app_localizations.dart';
import 'package:khatoon_container/l10n/generated/app_localizations_en.dart';
import 'package:khatoon_container/l10n/generated/app_localizations_fa.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';


extension LocalizationX on BuildContext {
  // AppLocalizations get l10n => (AppLocalizations.of(this)   ?? AppLocalizationsFa());
  AppLocalizations get l10n {
    final Locale locale = Localizations.localeOf(this);
    return AppLocalizations.of(this) ??
        (locale.languageCode == 'fa' ? AppLocalizationsFa() : AppLocalizationsEn());
  }
  // AppLocalizations   l10nCx(BuildContext context) => AppLocalizations.of(context)!;
}


extension ThemeColorsX on BuildContext {
  AppColors get colors {
    final AppColors? ext = Theme.of(this).extension<AppColors>();
    assert(ext != null, 'AppColors not found in ThemeData.extensions — make sure to add it.');
    return ext!;
  }
}
