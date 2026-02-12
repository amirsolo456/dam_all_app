// ==================== GLOBAL NOTIFIER ====================
import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/page_load_loading_builder/page_load_loading_builder_widget.dart';
import 'package:khatoon_container/src/core/event_base_core/micro_core.dart';
import 'package:khatoon_container/src/features/menu/utils/fake_menu_data.dart';
import 'package:khatoon_container/src/features/not_found/presentation/bloc/base_bloc/not_found_events.dart';
import 'package:khatoon_container/src/features/products/presentation/bloc/base_bloc/products_events.dart';

import 'package:khatoon_container/src/core/components/menu/domain/entities/menu_item.dart';
import 'package:khatoon_container/src/app/theme/app_theme.dart';
import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/src/features/user/data/repositories/user_local_repository.dart';
import 'package:khatoon_container/index.dart';

class AppNotifier extends ChangeNotifier {
  final List<MenuItemModel> _menuItems;

  AppNotifier({List<MenuItemModel>? initialMenuItems})
    : _menuItems = initialMenuItems ?? FakeMenuData().loadDefaultMenu();

  // ==================== STATE ====================
  List<MenuItemModel> get menuItems =>
      List<MenuItemModel>.unmodifiable(_menuItems);

  void addItem(MenuItemModel item) {
    _menuItems.add(item);
    notifyListeners();
  }

  void removeItem(MenuItemModel item) {
    _menuItems.remove(item);
    notifyListeners();
  }

  bool _coreDataLoaded = false;

  bool get coreDataLoaded => _coreDataLoaded;

  Future<void> loadCoreData(
    String? itemId, [
    ProgressCallback? progressCb,
  ]) async {
    try {
      // نمونه: اگر داده‌ها async هستند
      // await fetchDataFromAPI(progressCb);
      await Future<void>.delayed(const .new(seconds: 2));

      _coreDataLoaded = true;
      selectItem(itemId ?? '');
      notifyListeners();
    } catch (e) {
      _coreDataLoaded = false;
      rethrow;
    }
  }

  final Map<String, Widget> _generatedPages = <String, Widget>{};

  final bool _isMenuLoading = false;
  String? _errorMessage;
  AppTheme _themeConfig = .new();

  String? _selectedItemId;
  bool _sidebarCollapsed = false;
  bool _isDrawerOpen = false;
  bool _isLogin = false;
  bool _isLoading = false;
  UserModel? _user;

  String? _userName;
  String? _userEmail;
  String? _userRole;
  final Map<String, bool> _expandedStates = <String, bool>{};
  String? _currentRoute;

  /// Current emitted event (intention). Micro-apps should register builders
  /// with [MicroAppWidgetRegistry] so the UI can resolve a Widget for this
  /// event and show it insitemIde the detail pane (IndexedStack in ContentWrapper).
  RouteEvent? _currentEvent;

  RouteEvent? get currentEvent => _currentEvent;

  // ==================== MENU HELPERS ====================
  void emit(RouteEvent event) {
    _currentEvent = event;
    CustomEventBus.emit(event);
    notifyListeners();
  }

  Future<void> initialize() async {
    _user = (await sl<UserLocalRepository>().getUserById(0));
  }

  void navigateTo(
    String routeName, {
    Object? arguments,
    BuildContext? context,
  }) {
    _currentRoute = routeName;
    final MicroAppsName? micro = getMicroAppNameByString(routeName);
    if (micro != null) {
      final RouteEvent? ev = _mapRouteToEvent(micro, null);

      if (ev != null) {
        final Object? _ = navigatorKey.currentState?.pushNamed(
          '/${micro.name}',
          arguments: arguments,
        );
        if (context != null) {
          FocusScope.of(context).unfocus();
        }

        // emit(ev);
        // CustomEventBus.emit(ev);
        notifyListeners();
      }
    }
  }

  // ==================== NAVIGATION ====================

  void toggleExpanded(String itemId) {
    _expandedStates[itemId] = !isExpanded(itemId);
    notifyListeners();
  }

  void selectItem(String itemId, {bool closeDrawer = true}) {
    final MenuItemModel? item = findItemByItemId(itemId);
    if (item == null) return;

    _selectedItemId = itemId;
    _currentRoute = item.routeName;

    if (closeDrawer) {
      _isDrawerOpen = false;
    }

    if (item.routeName != null) {
      final MicroAppsName? appName = getMicroAppNameByString(item.routeName!);
      if (appName != null) {
        final RouteEvent? ev = _mapRouteToEvent(appName, item);
        if (ev != null) {
          emit(ev);
          notifyListeners();
        }
      }
    }
  }

  MicroAppsName? getMicroAppNameByString(String route) {
    return MicroAppsName.values
        .toList()
        .where(
          (MicroAppsName c) =>
              c.name.toLowerCase() ==
              (route.startsWith('/')
                  ? route.toLowerCase().split('/')[1]
                  : route.toLowerCase()),
        )
        .firstOrNull;
  }

  void clearPageCache() {
    _generatedPages.clear();
    notifyListeners();
  }

  void goBack() {
    notifyListeners();
  }

  RouteEvent? _mapRouteToEvent(MicroAppsName routeName, MenuItemModel? item) {
    switch (routeName) {
      case MicroAppsName.reports:
        return ReportsInitialEvents();
      case MicroAppsName.profile:
        return ProfileShownEvent(item?.itemId ?? '');
      case MicroAppsName.settings:
        return SettingsShownEvent();
      case MicroAppsName.purchases:
        return PurchaseShownEvent('Shown');
      case MicroAppsName.animalProducts:
        return AnimalProductsShownEvent();
      // case MicroAppsName.animalFormProducts:
      //   return AnimalProductsFormShownEvent();
      // case MicroApps.purchases:
      //   return PurchaseCreateNewEvent();
      case MicroAppsName.signIn:
        return UserLoggedOutEvent();
      default:
        return NotFoundEvents();
    }
  }

  bool checkIsLogin() {
    if (_selectedItemId == null ||
        selectedItem == null ||
        !selectedItem!.routeName!.contains('signIn')) {
      return false;
    }
    return true;
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Timer? _sidebarTimer;

  void toggleSidebar() {
    _sidebarCollapsed = !_sidebarCollapsed;
    notifyListeners();
  }

  void sidebarManually(bool collapse) {
    if (_sidebarCollapsed == collapse) return;

    // debounce کوتاه برای جلوگیری از فراخوانی‌های پشت سر هم هنگام حرکت موس
    _sidebarTimer?.cancel();
    _sidebarTimer = Timer(const Duration(milliseconds: 80), () {
      if (_sidebarCollapsed != collapse) {
        _sidebarCollapsed = collapse;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _sidebarTimer?.cancel();
    super.dispose();
  }

  void setSidebarCollapsed(bool collapsed) {
    _sidebarCollapsed = collapsed;
    notifyListeners();
  }

  void changeToLogin(bool loginState) {
    _isLogin = loginState;
    notifyListeners();
    _selectedItemId = 'purchases';
    emit(UserLoggedInEvent());
  }

  // ==================== USER METHODS ====================
  void updateUserInfo({String? name, String? email, String? role}) {
    _userName = name ?? _userName;
    _userEmail = email ?? _userEmail;
    _userRole = role ?? _userRole;
    notifyListeners();
  }

  void logout() {
    _userName = null;
    _userEmail = null;
    _userRole = null;
    _selectedItemId = null;
    _currentRoute = Routes.signIn.value;
    _expandedStates.clear();
    _isLogin = false;
    navigateTo(Routes.signIn.value);
    notifyListeners();
  }

  void resetAll() {
    _expandedStates.clear();
    _selectedItemId = null;
    _currentRoute = Routes.signIn.value;
    _themeConfig = .new();
    _isDrawerOpen = false;
    _isLoading = false;
    _errorMessage = null;
    _userName = null;
    _userEmail = null;
    _userRole = null;
    notifyListeners();
  }

  // ==================== GETTERS ====================
  bool get menuIsLoaded => !_isMenuLoading;

  List<MenuItemModel> get menuItemModels => _menuItems;

  String? get errorMessage => _errorMessage;

  AppTheme get themeConfig => _themeConfig;

  UserModel? get currentUser => _user;

  bool get isSidebarCollapsed => _sidebarCollapsed;

  bool get isDrawerOpen => _isDrawerOpen;

  String? get selectedItemId => _selectedItemId;

  bool get isLogin => _isLogin;

  bool get isLoading => _isLoading;

  bool get isMenuLoading => _isMenuLoading;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  String? get userRole => _userRole;

  String? get currentRoute => _currentRoute;

  // Helper methods
  MenuItemModel? findItemByItemId(String itemId) {
    MenuItemModel? findInList(List<MenuItemModel> items) {
      for (MenuItemModel item in items) {
        if (item.itemId == itemId) return item;
        if (item.childrens != null) {
          final MenuItemModel? found = findInList(item.childrens!);
          if (found != null) return found;
        }
      }
      return null;
    }

    return findInList(_menuItems);
  }

  bool isExpanded(String itemId) => _expandedStates[itemId] ?? false;

  bool isSelected(String itemId) => _selectedItemId == itemId;

  MenuItemModel? get selectedItem {
    if (_selectedItemId == null) return null;

    return findItemByItemId(_selectedItemId!);
  }

  // ==================== THEME METHODS ====================
  void toggleTheme() {
    final bool isLight = ((_themeConfig.themeMode == ThemeMode.light));
    if (isLight) {
      final AppTheme theme = _themeConfig.copyWith(themeMode: ThemeMode.dark);
      _themeConfig = theme;
    } else {
      final AppTheme theme = _themeConfig.copyWith(themeMode: ThemeMode.light);
      _themeConfig = theme;
    }

    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeConfig = _themeConfig.copyWith(themeMode: mode);
    notifyListeners();
  }

  void updatePrimaryColor(Color color) {
    _themeConfig = _themeConfig.copyWith(primaryColor: color);
    notifyListeners();
  }

  void updateSecondaryColor(Color color) {
    _themeConfig = _themeConfig.copyWith(secondaryColor: color);
    notifyListeners();
  }

  // ==================== UI STATE METHODS ====================
  void toggleDrawer() {
    _isDrawerOpen = !_isDrawerOpen;
    notifyListeners();
  }

  void setDrawerOpen(bool isOpen) {
    _isDrawerOpen = isOpen;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    if (!loading) {
      _errorMessage = null;
    }
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
