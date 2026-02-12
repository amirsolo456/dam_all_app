import 'package:khatoon_container/src/features/app_shortcuts/domain/entities/shortcut.dart';
typedef ShortcutHandler = void Function(Shortcut shortcut);

abstract class  IShortcutsRepository {

  void registerHandler(ShortcutHandler h);
  void unregisterHandler(ShortcutHandler h);

  Future<void> init() ;

  // helper to trigger programmatically (useful for testing or keyboard actions)
  void trigger(Shortcut s) ;
}