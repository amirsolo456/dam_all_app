// main.dart (یا در Shell widget)
import 'package:flutter/services.dart';
import 'package:khatoon_container/src/features/app_shortcuts/data/respositories/shortcuts_repository.dart';
import 'package:khatoon_container/src/features/app_shortcuts/domain/entities/shortcut.dart';
import 'package:khatoon_container/index.dart';

final Map<LogicalKeySet, Intent> shortcutsMap = <LogicalKeySet, Intent>{
  LogicalKeySet(LogicalKeyboardKey.controlLeft,LogicalKeyboardKey.keyV): const ActivateSearchIntent(),
  LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.keyV):
      OpenMicroAppIntent(MicroAppsName.purchases.persianName),
};

class ActivateSearchIntent extends Intent {
  const ActivateSearchIntent();
}

class OpenMicroAppIntent extends Intent {
  final String micro;

  const OpenMicroAppIntent(this.micro);
}

class ShortCutsWidget extends StatelessWidget {
  final ShortcutService shortcutService;

  const ShortCutsWidget(this.shortcutService, {super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: shortcutsMap,
      child: Actions(
        actions: <Type, Action<Intent>>{
          ActivateSearchIntent: CallbackAction<Intent>(
            onInvoke: (Intent intent) {
              shortcutService.trigger(
                Shortcut(
                  id: 'kb_search',
                  action: 'open',
                  target: 'microapp:search',
                ),
              );
              return null;
            },
          ),
          OpenMicroAppIntent: CallbackAction<Intent>(
            onInvoke: (Intent intent) {
              final String micro = (intent as OpenMicroAppIntent).micro;
              shortcutService.trigger(
                Shortcut(
                  id: 'kb_open_$micro',
                  action: 'open',
                  target: 'microapp:$micro',
                ),
              );
              return null;
            },
          ),
        },
        child: const Focus(autofocus: true, child: Text('a')),
      ),
    );
  }
}
