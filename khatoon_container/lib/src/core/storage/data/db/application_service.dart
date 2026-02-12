import 'package:flutter/material.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';

class ApplicationService {
  static final List<ActionButtons<dynamic>> profileMenuData = <ActionButtons<dynamic>>[
    ActionButtons<dynamic>(
      'تنظیمات حساب',
      const Icon(Icons.settings),
      () => <void>{sl<AppNotifier>().emit(ProfileAccountSettingsEvent())},
    ),
  ];
}
