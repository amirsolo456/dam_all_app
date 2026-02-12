import 'package:khatoon_container/src/features/app_shortcuts/domain/entities/shortcut.dart';
import 'package:khatoon_container/src/features/app_shortcuts/domain/repositories/i_shortcuts_repository.dart';
import 'package:khatoon_container/index.dart';
import 'package:quick_actions/quick_actions.dart'; // mobile home shortcuts

typedef ShortcutHandler = void Function(Shortcut shortcut);

class ShortcutService implements IShortcutsRepository {
  final QuickActions _quickActions = const QuickActions();
  final List<ShortcutHandler> _listeners = <ShortcutHandler>[];

  // map of id -> AppShortcut (for local lookup)
  final Map<String, Shortcut> _registered = <String, Shortcut>{};

  @override
  void registerHandler(ShortcutHandler h) => _listeners.add(h);

  @override
  void unregisterHandler(ShortcutHandler h) => _listeners.remove(h);

  @override
  Future<void> init() async {
    // init mobile quick actions
    _quickActions.initialize((String type) {
      final Shortcut? s = _registered[type];
      if (s != null) _emit(s);
    });

    // (optional) set initial items (static or dynamic)
    await _setQuickActions(<Shortcut>[
      Shortcut(
        id: 'open_payments',
        action: 'open',
        target: MicroAppsName.purchases.persianName,
      ),
      Shortcut(
        id: 'compose_message',
        action: 'open',
        target:  MicroAppsName.purchases.persianName,
        params: <String, dynamic>{'new': true},
      ),
    ]);
  }

  Future<void> _setQuickActions(List<Shortcut> items) async {
    _registered.clear();
    _registered.addEntries(
      items.map((Shortcut i) => MapEntry<String, Shortcut>(i.id, i)),
    );
    final List<ShortcutItem> shortcutItems = items
        .map((Shortcut i) => ShortcutItem(type: i.id, localizedTitle: i.target))
        .toList();
    await _quickActions.setShortcutItems(shortcutItems);
  }

  void _emit(Shortcut s) {
    for (final ShortcutHandler h in _listeners) {
      try {
        h(s);
      } catch (_) {}
    }
  }

  @override
  void trigger(Shortcut s) => _emit(s);

  void wireShortcuts(ShortcutService shortcuts) {
    shortcuts.registerHandler((Shortcut s) {
      if (s.target.startsWith('microapp:')) {
        final String micro = s.target.split(':')[1];
        final AppNotifier notifier = sl<AppNotifier>();
        final Map<String, dynamic> rawParams = s.params ?? <String, dynamic>{};
        final Object args =
            ShortCutsResolver.resolve(micro, rawParams) ?? rawParams;
        notifier.navigateTo('/micro/$micro', arguments: args);
        // Routing.pushNamed(
        //   notifier.getRoutesByNme('/micro/$micro'),
        //   arguments: null,
        // );
        // final Map<String, dynamic> rawParams = s.params ?? <String, dynamic>{};
        // final Object args =
        //     ShortCutsResolver.resolve(micro, rawParams) ?? rawParams;
        // // sl<AppNotifier>().navigateTo()
        // Routing.pushNamed(
        //   notifier.getShortCutsRoutByNme('/micro/$micro'),
        // );
      }
    });
  }
}
