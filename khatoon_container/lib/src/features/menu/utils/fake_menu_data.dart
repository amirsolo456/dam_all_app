import 'package:khatoon_container/src/core/components/menu/domain/entities/menu_item.dart';
import 'package:khatoon_container/index.dart';

class FakeMenuData {
  List<MenuItemModel> loadDefaultMenu() {
    List<MenuItemModel> menuItemModels = <MenuItemModel>[];
    menuItemModels = <MenuItemModel>[
      MenuItemModel(
        itemId: 'home',
        pageIndex: 0,
        label: 'خانه',
        routeName: '/home',
      ),
      MenuItemModel(
        pageIndex: 1,
        itemId: 'products',
        label: 'محصولات',
        childrens: <MenuItemModel>[
          MenuItemModel(
            pageIndex: 0,
            itemId: MicroAppsName.animalProducts.name,
            label: 'همه محصولات',
            routeName: '/${MicroAppsName.animalProducts.name}',
          ),
          MenuItemModel(
            pageIndex: 2,
            itemId: 'inventory',
            label: 'موجودی انبار',
            routeName: '/inventory',
          ),
        ],
      ),
      MenuItemModel(
        pageIndex: 2,
        itemId: 'orders',
        label: 'سفارشات',
        childrens: <MenuItemModel>[
          MenuItemModel(
            pageIndex: 0,
            itemId: 'pending_orders',
            label: 'در انتظار تایید',
            routeName: '/orders/pending',
          ),
          MenuItemModel(
            pageIndex: 1,
            itemId: 'completed_orders',
            label: 'تکمیل شده',
            routeName: '/orders/completed',
          ),
        ],
      ),
      MenuItemModel(
        label: 'پرداخت',
        pageIndex: 6,
        itemId: MicroAppsName.purchases.name,
        routeName: '/${MicroAppsName.purchases.name}',
      ),
      MenuItemModel(
        pageIndex: 3,
        itemId: 'customers',
        label: 'مشتریان',
        routeName: '/customers',
      ),
      MenuItemModel(
        pageIndex: 4,
        itemId: MicroAppsName.reports.name,
        routeName: '/${MicroAppsName.reports.name}',
        label: 'گزارشات',
      ),
      MenuItemModel(
        pageIndex: 5,
        label: 'پروفایل',
        itemId: MicroAppsName.profile.name,
        routeName: '/${MicroAppsName.profile.name}',
      ),

      MenuItemModel(
        pageIndex: 7,
        itemId: MicroAppsName.settings.name,
        routeName: '/${MicroAppsName.settings.name}',
        label: 'تنظیمات',
        childrens: <MenuItemModel>[
          MenuItemModel(
            pageIndex: 8,
            itemId: 'security',
            label: 'امنیت',
            routeName: '/settings/security',
          ),
          MenuItemModel(
            pageIndex: 9,
            itemId: 'notifications',
            label: 'اعلان‌ها',
            routeName: '/settings/notifications',
          ),
        ],
      ),
      MenuItemModel(
        pageIndex: 7,
        itemId: MicroAppsName.signIn.name,
        routeName: '/${MicroAppsName.signIn.name}',
        label: 'خروج',
      ),
    ];
    return menuItemModels;
  }
}
