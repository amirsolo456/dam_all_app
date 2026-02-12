import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  // final List<MenuItemModel> menuItems = <MenuItemModel>[
  //   MenuItemModel(
  //     label: 'Counters',
  //     icon: const Icon(Icons.list),
  //     pageIndex: 0,
  //     id: 'Management',
  //     title: '',
  //   ),
  //   MenuItemModel(
  //     label: 'Management',
  //     icon: const Icon(Icons.dashboard),
  //
  //     id: 'Management',
  //     pageIndex: -1,
  //     children: <MenuItemModel>[
  //       MenuItemModel(
  //         label: 'Users',
  //         icon: const Icon(Icons.person),
  //         pageIndex: 1,
  //         id: 'Users',
  //         title: '',
  //       ),
  //       MenuItemModel(
  //         label: 'Reports',
  //         icon: const Icon(Icons.bar_chart),
  //
  //         pageIndex: 2,
  //         id: 'Users',
  //         title: '',
  //       ),
  //     ],
  //     title: '',
  //   ),
  //   MenuItemModel(
  //     label: 'Settings',
  //     icon: const Icon(Icons.settings),
  //
  //     pageIndex: 3,
  //     id: 'Settings',
  //     title: '',
  //   ),
  // ];

  void selectPage(int pageIndex) {
    if (pageIndex >= 0) {
      _selectedPageIndex = pageIndex;
      notifyListeners();
    }
  }
}
