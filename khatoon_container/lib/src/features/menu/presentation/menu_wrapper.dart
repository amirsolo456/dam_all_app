// import 'package:flutter/cupertino.dart';
// import 'package:khatoon_container/app_notifier.dart';
// import 'package:khatoon_container/core/components/menu/domain/entities/menu_item.dart';
// import 'package:khatoon_container/core/components/menu/presentation/widgets/menu.dart';
//
// class MenuWrapper extends StatelessWidget {
//   final CallbackAction<MenuItemModel> onTab; // حتما مقدار بدید
//   final AppNotifier notifier;
//
//   const MenuWrapper({
//     super.key,
//     required this.notifier,
//     required this.onTab, // اضافه شد
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableMenu(
//       isRail: true,
//       menuItems: notifier.menuItemModels,
//       onItemSelected: (MenuItemModel item) {
//         onTab(item); // callback صحیح فراخوانی میشه
//       },
//     );
//   }
// }
