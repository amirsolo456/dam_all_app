import 'package:flutter/material.dart';
import 'package:khatoon_container/src/features/menu/domain/entities/menu_item.dart';
import 'package:khatoon_container/index.dart';

class MenuItemModel extends MenuItem {
  final String label;
  late final Icon icon;
  final String itemId;

  // final String iconSrc;
  final List<MenuItemModel>? childrens;

  // T? resolver;
  final String? routeName;
  final int pageIndex;

  MenuItemModel({
    required this.label,
    // required this.iconSrc,
    this.childrens,
    required this.pageIndex,
    this.routeName,
    required this.itemId,
    super.title,
  }) : assert(childrens == null || childrens.isNotEmpty),
       super(id: '') {
    icon = IconMapper.getIcon(itemId);
  }

  factory MenuItemModel.page({
    required String id,
    required int pageIndex,
    required String label,
    required Icon icon,
  }) {
    return MenuItemModel(
      itemId: id,
      pageIndex: pageIndex,
      label: label,
      title: '',
    );
  }

  factory MenuItemModel.withIconSource({
    required String id,
    required int pageIndex,
    required String label,
    required String iconSource,
  }) {
    return MenuItemModel(label: label, pageIndex: pageIndex, itemId: id);
  }

  factory MenuItemModel.fromMenuItem(
    MenuItem item, {
    Icon? customIcon,
    int? pageIndex,
    List<MenuItemModel>? children,
  }) {
    return MenuItemModel(
      itemId: item.id,
      label: item.title ?? '',
      childrens: children,
      pageIndex: pageIndex ?? 0,
      routeName: item.route,
    );
  }
}

class IconMapper {
  static final Map<String, IconData> _map = <String, IconData>{
    MicroAppsName.purchases.name: const IconData(
      fontFamily: 'assets/invoice.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.profile.name: const IconData(
      fontFamily: 'assets/user_profile.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.reports.name: const IconData(
      fontFamily: 'assets/user_profile.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.notFound.name: const IconData(
      fontFamily: 'assets/user_profile.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.settings.name: const IconData(
      fontFamily: 'assets/setting.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.shortCuts.name: const IconData(
      fontFamily: 'assets/user_profile.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.signIn.name: const IconData(
      fontFamily: 'assets/sign_out.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.menu.name: const IconData(
      fontFamily: 'assets/menu.png',
      0xe800,
      matchTextDirection: true,
    ),
    MicroAppsName.animalProducts.name: const IconData(
      fontFamily: 'assets/menu.png',
      0xe800,
      matchTextDirection: true,
    ),
  };

  static Icon getIcon(String itemId) {
    final IconData? icon = _map[itemId];
    return Icon(icon ?? Icons.category, size: 20);
  }

  static String getImageIcon(String itemId) {
    final IconData? _ = _map[itemId];
    return (_map[itemId] ?? Icons.category).fontFamily ??
        'assets/icon_not_found.png';
  }

  static String getIconName(IconData iconData) {
   return _map.entries
        .firstWhere(
          (MapEntry<String, IconData> entry) => entry.value == iconData,
          orElse: () =>
              const MapEntry<String, IconData>('category', Icons.category),
        )
        .key;

  }
}
