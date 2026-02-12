import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khatoon_container/src/core/components/menu/utils/log.dart';
import 'package:khatoon_container/index.dart';
import 'package:provider/provider.dart';
import 'package:khatoon_container/src/core/components/menu/domain/entities/menu_item.dart';

/// Responsive, clean MenuWidget (refactored)
// class MenuWidget extends StatelessWidget {
//   final bool isRail;
//   final List<MenuItemModel> menuItems;
//   final void Function(MenuItemModel)? onItemSelected;
//
//   const MenuWidget({
//     super.key,
//     required this.isRail,
//     required this.menuItems,
//     this.onItemSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<AppNotifier, bool>(
//       selector: (_, AppNotifier n) => n.isMenuLoading,
//       builder: (_, bool isMenuLoading, _) {
//         if (isMenuLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         return Selector<AppNotifier, bool>(
//           selector: (_, AppNotifier n) => n.isSidebarCollapsed,
//           builder: (BuildContext context, bool sidebarCollapsed, _) {
//             final Column menuContent = Column(
//               mainAxisSize: MainAxisSize.min,
//               textDirection: TextDirection.rtl,
//               children: <Widget>[
//                 Expanded(
//                   child: MouseRegion(
//                     onEnter: (_) =>
//                         context.read<AppNotifier>().sidebarManually(false),
//                     onExit: (_) =>
//                         context.read<AppNotifier>().sidebarManually(true),
//                     child: ListView.builder(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       itemCount: menuItems.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final MenuItemModel item = menuItems[index];
//                         return ParentMenuItem(
//                           item: item,
//                           sidebarCollapsed: sidebarCollapsed,
//                           onItemSelected: onItemSelected,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 _buildFooter(
//                   context,
//                   context.read<AppNotifier>(),
//                   sidebarCollapsed,
//                 ),
//               ],
//             );
//
//             if (!isRail) {
//               return Drawer(width: 280, child: SafeArea(child: menuContent));
//             }
//
//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 250),
//               curve: Curves.easeInOut,
//               alignment: Alignment.centerLeft,
//               transformAlignment: Alignment.centerLeft,
//               constraints: const BoxConstraints(minWidth: 90, maxWidth: 280),
//               margin: const EdgeInsets.all(5),
//               width: sidebarCollapsed ? 90 : 280,
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 border: Border(
//                   right: BorderSide(
//                     color: Theme.of(context).dividerColor.withAlpha(60),
//                   ),
//                 ),
//               ),
//               child: SafeArea(child: menuContent),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildFooter(
//     BuildContext context,
//     AppNotifier notifier,
//     bool sidebarCollapsed,
//   ) {
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(color: Theme.of(context).dividerColor.withAlpha(80)),
//         ),
//       ),
//       child: sidebarCollapsed
//           ? Center(
//               child: IconButton(
//                 onPressed: notifier.toggleSidebar,
//                 icon: Icon(
//                   Icons.menu_open,
//                   color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
//                 ),
//                 padding: EdgeInsets.zero,
//                 tooltip: 'باز کردن منو',
//               ),
//             )
//           : Row(
//               children: <Widget>[
//                 const Spacer(),
//                 IconButton(
//                   onPressed: notifier.toggleSidebar,
//                   icon: Icon(
//                     Icons.menu,
//                     color: Theme.of(
//                       context,
//                     ).colorScheme.onSurface.withAlpha(150),
//                   ),
//                   tooltip: 'کوچک کردن منو',
//                 ),
//                 if (notifier.userName != null)
//                   IconButton(
//                     onPressed: notifier.logout,
//                     icon: Icon(
//                       Icons.logout,
//                       color: Theme.of(
//                         context,
//                       ).colorScheme.onSurface.withAlpha(150),
//                     ),
//                     tooltip: 'خروج',
//                   ),
//               ],
//             ),
//     );
//   }
// }
class MenuWidget extends StatefulWidget {
  final bool isRail;
  final List<MenuItemModel> menuItems;
  final void Function(MenuItemModel)? onItemSelected;

  const MenuWidget({
    super.key,
    required this.isRail,
    required this.menuItems,
    this.onItemSelected,
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final ValueNotifier<bool> _isCollapsed = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final Column menuContent = Column(
      children: <Widget>[
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() {
              _isCollapsed.value = false;
            }),
            onExit: (_) => setState(() {
              _isCollapsed.value = true;
            }),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: widget.menuItems.length,
              itemBuilder: (_, int index) {
                final MenuItemModel item = widget.menuItems[index];
                return ParentMenuItem(
                  item: item,
                  sidebarCollapsedNotifier: _isCollapsed, // <— فقط notifier
                  onItemSelected: widget.onItemSelected,
                );
              },
            ),
          ),
        ),
        // Footer می‌تواند همونجا باشه و با ValueListenableBuilder کنترل شود
      ],
    );

    if (!widget.isRail) {
      return Drawer(width: 280, child: SafeArea(child: menuContent));
    }

    return AnimatedBuilder(
      animation: _isCollapsed,
      builder: (_, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: _isCollapsed.value ? 90 : 280,
          child: SafeArea(child: menuContent),
        );
      },
    );
  }
}

/// Parent item widget — listens only to expanded & selected state for this item.
/// Parent item widget — with debug + fallback UI
class ParentMenuItem extends StatelessWidget {
  final MenuItemModel item;
  final ValueNotifier<bool> sidebarCollapsedNotifier;
  final void Function(MenuItemModel)? onItemSelected;

  const ParentMenuItem({
    super.key,
    required this.item,
    required this.sidebarCollapsedNotifier,
    this.onItemSelected,
  });

  void _handleTap(BuildContext context) {
    const String tag = 'Menu:HandleTap';

    try {
      final AppNotifier notifier = sl<AppNotifier>();
      if ((item.childrens?.isNotEmpty ?? false)) {
        notifier.toggleExpanded(item.itemId);
      } else {
        notifier.selectItem(item.itemId);
        onItemSelected?.call(item);
        // if (!isRail) Navigator.of(context).pop();
      }

      // final bool hasChildren = (item.childrens?.isNotEmpty ?? false);
      // if (hasChildren) {
      //   notifier.toggleExpanded(item.itemId);
      // } else {
      //   notifier.selectItem(item.itemId);
      //   onItemSelected?.call(item);
      //   if (!sidebarCollapsed) Navigator.of(context).pop();
      // }

      // Log.info(tag, 'tap روی ${item.itemId} | hasChildren=$hasChildren');

      // if (hasChildren) {
      //   notifier.toggleExpanded(item.itemId);
      // } else {
      //   notifier.selectItem(item.itemId);
      //   onItemSelected?.call(item);
      //
      //   if (!sidebarCollapsed && Navigator.canPop(context)) {
      //     Navigator.of(context).pop();
      //   }
      // }
    } catch (e, s) {
      Log.error(tag, 'خطا در handleTap برای ${item.itemId}', e, s);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuItemModel>? childrenList = item.childrens;

    return Selector<AppNotifier, bool>(
      selector: (_, AppNotifier notifier) => notifier.isExpanded(item.itemId),
      builder: (BuildContext context, bool isExpanded, _) {
        // debug print to see runtime shape

        return Selector<AppNotifier, String?>(
          selector: (_, AppNotifier notifier) => notifier.selectedItemId,
          builder: (BuildContext context, String? selectedId, _) {
            final bool isSelected = selectedId == item.itemId;
            final bool hasChildren = (item.childrens?.isNotEmpty ?? false);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  elevation: 2,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary.withAlpha(30)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => _handleTap(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: .center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 24),
                            child: Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  width: 24,
                                  height: 24,
                                   IconMapper.getImageIcon(item.itemId) ,
                                  // 'assets/invoice.png',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                // child: Image.asset(
                                //   IconMapper.getImageIcon(item.itemId),
                                //   width: 24,
                                //   height: 24,
                                //   fit: BoxFit.contain,filterQuality: FilterQuality.high,
                                // ),
                              ),
                            ),
                          ),
                          if (!sidebarCollapsedNotifier.value) ...<Widget>[
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Nazir',
                                  fontWeight: isSelected
                                      ? FontWeight.w800
                                      : FontWeight.w600,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (hasChildren)
                              AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0.0,
                                duration: const Duration(milliseconds: 250),
                                child: Icon(
                                  Icons.expand_more,
                                  size: 18,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withAlpha(160),
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),

                // children area: if expanded but children null or empty show placeholder
                if (hasChildren && !sidebarCollapsedNotifier.value)
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: isExpanded
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: childrenList!
                                .map(
                                  (MenuItemModel c) => ChildMenuItem(
                                    child: c,
                                    onItemSelected: onItemSelected,
                                  ),
                                )
                                .toList(),
                          )
                        : const SizedBox.shrink(),
                  )
                else if (!sidebarCollapsedNotifier.value && isExpanded)
                  // expanded but no children -> show a helpful placeholder:
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 6,
                      bottom: 6,
                    ),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'آیتمی وجود ندارد',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(140),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

/// Child item widget
class ChildMenuItem extends StatelessWidget {
  final MenuItemModel child;
  final void Function(MenuItemModel)? onItemSelected;

  const ChildMenuItem({super.key, required this.child, this.onItemSelected});

  void _handleTap(BuildContext context) {
    final AppNotifier notifier = context.read<AppNotifier>();
    notifier.selectItem(child.itemId);
    onItemSelected?.call(child);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AppNotifier, String?>(
      selector: (_, AppNotifier notifier) => notifier.selectedItemId,
      builder: (BuildContext context, String? selectedId, _) {
        final bool isSelected = selectedId == child.itemId;
        return Padding(
          padding: const EdgeInsets.only(right: 20, top: 6, bottom: 6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => _handleTap(context),
            child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                SizedBox(
                  width: 28,
                  child: Center(
                    child: SvgPicture.asset(
                      width: 24,
                      height: 24,
                      IconMapper.getImageIcon(child.itemId) ,
                      // 'assets/invoice.png',
                      colorFilter:   ColorFilter.mode(
                          isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(160),
                        BlendMode.srcIn,
                      ),
                    ),
                    // child: ImageIcon(
                    //   AssetImage(IconMapper.getImageIcon(child.itemId)),
                    //   size: 18,
                    //   color: isSelected
                    //       ? Theme.of(context).colorScheme.primary
                    //       : Theme.of(
                    //           context,
                    //         ).colorScheme.onSurface.withAlpha(160),
                    // ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    child.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Child item widget — listens only to selectedItemId
// class ChildMenuItem extends StatelessWidget {
//   final MenuItemModel child;
//   final void Function(MenuItemModel)? onItemSelected;
//
//   const ChildMenuItem({super.key, required this.child, this.onItemSelected});
//
//   void _handleTap(BuildContext context) {
//     final AppNotifier notifier = context.read<AppNotifier>();
//     notifier.selectItem(child.itemId);
//     onItemSelected?.call(child);
//     // if you need to close a drawer or navigate, handle it in onItemSelected or here.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<AppNotifier, String?>(
//       selector: (_, AppNotifier notifier) => notifier.selectedItemId,
//       builder: (BuildContext context, String? selectedId, _) {
//         final bool isSelected = selectedId == child.itemId;
//
//         return Padding(
//           padding: const EdgeInsets.only(right: 20, top: 6, bottom: 6),
//           child: InkWell(
//             borderRadius: BorderRadius.circular(6),
//             onTap: () => _handleTap(context),
//             child: Row(
//               textDirection: TextDirection.rtl,
//               children: <Widget>[
//                 SizedBox(
//                   width: 28,
//                   child: Center(
//                     child: ImageIcon(
//                       AssetImage(IconMapper.getImageIcon(child.itemId)),
//                       size: 18,
//                       color: isSelected
//                           ? Theme.of(context).colorScheme.primary
//                           : Theme.of(
//                               context,
//                             ).colorScheme.onSurface.withAlpha(160),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     child.label,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: isSelected
//                           ? FontWeight.w500
//                           : FontWeight.w400,
//                       color: isSelected
//                           ? Theme.of(context).colorScheme.primary
//                           : Theme.of(context).colorScheme.onSurface,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

/// Child item widget — listens only to selectedItemId
// class ChildMenuItem extends StatelessWidget {
//   final MenuItemModel child;
//   final void Function(MenuItemModel)? onItemSelected;
//
//   const ChildMenuItem({super.key, required this.child, this.onItemSelected});
//
//   void _handleTap(BuildContext context) {
//     final AppNotifier notifier = context.read<AppNotifier>();
//     notifier.selectItem(child.itemId);
//     onItemSelected?.call(child);
//     // if you need to close a drawer or navigate, handle it in onItemSelected or here.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<AppNotifier, String?>(
//       selector: (_, AppNotifier notifier) => notifier.selectedItemId,
//       builder: (BuildContext context, String? selectedId, _) {
//         final bool isSelected = selectedId == child.itemId;
//
//         return Padding(
//           padding: const EdgeInsets.only(right: 20, top: 6, bottom: 6),
//           child: InkWell(
//             borderRadius: BorderRadius.circular(6),
//             onTap: () => _handleTap(context),
//             child: Row(
//               textDirection: TextDirection.rtl,
//               children: <Widget>[
//                 SizedBox(
//                   width: 28,
//                   child: Center(
//                     child: ImageIcon(
//                       AssetImage(IconMapper.getImageIcon(child.itemId)),
//                       size: 18,
//                       color: isSelected
//                           ? Theme.of(context).colorScheme.primary
//                           : Theme.of(
//                               context,
//                             ).colorScheme.onSurface.withAlpha(160),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     child.label,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: isSelected
//                           ? FontWeight.w500
//                           : FontWeight.w400,
//                       color: isSelected
//                           ? Theme.of(context).colorScheme.primary
//                           : Theme.of(context).colorScheme.onSurface,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
