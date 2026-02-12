import 'dart:async';
import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_theme.dart';
import 'package:khatoon_container/src/core/components/menu/domain/entities/menu_item.dart';
import 'package:khatoon_container/src/core/components/menu/presentation/widgets/menu_widget.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_container/src/core_wrapper.dart';

class ContentWrapper extends StatefulWidget {
  final AppNotifier notifier;

  const ContentWrapper({super.key, required this.notifier});

  @override
  State<ContentWrapper> createState() => _ContentWrapperState();
}

class _ContentWrapperState extends State<ContentWrapper> {
  double menuWidth = 0;

  /// اگر CustomEventBus.on یک StreamSubscription برمی‌گرداند،
  /// این متغیر برای کنسل کردن استفاده خواهد شد.
  dynamic _userLoggedInSub;

  @override
  void initState() {
    super.initState();

    // فقط صدا میزنیم، چیزی برنمی‌گرده
    CustomEventBus.on<UserLoggedInEvent>((UserLoggedInEvent event) {
      if (!mounted) return;
      setState(() {
        menuWidth = widget.notifier.isLogin ? 270 : 0;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      for (final MenuItemModel item in widget.notifier.menuItemModels) {
        precacheImage(
          AssetImage(IconMapper.getImageIcon(item.itemId)),
          context,
        );
        if (item.childrens != null) {
          for (final MenuItemModel c in item.childrens!) {
            precacheImage(
              AssetImage(IconMapper.getImageIcon(c.itemId)),
              context,
            );
          }
        }
      }
    });
  }

  // @override
  // void dispose() {
  //   // چیزی برای کنسل کردن نداریم چون on void برمی‌گردونه
  //   super.dispose();
  // }

  @override
  void dispose() {
    // اگر CustomEventBus.on یک StreamSubscription فرستاده، آن را کنسل کن
    try {
      if (_userLoggedInSub is StreamSubscription) {
        (_userLoggedInSub as StreamSubscription<dynamic>).cancel();
      }
      // اگر CustomEventBus API متفاوتی برای لغو دارد، آن را اینجا صدا بزن.
      // مثال: if (_userLoggedInSub is Function) _userLoggedInSub();
    } catch (_) {
      // ignore: avoid_print
      // print('Could not cancel event subscription: $_');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = widget.notifier.isLogin;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: SafeArea(child: MainAppBarWidget()),
      ),
      drawer: Drawer(
        elevation: 2,
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        child: const SizedBox(),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 72,
            child: Row(
              children: <Widget>[
                if (isLoggedIn)
                  RepaintBoundary(
                    child: MenuWidget(
                      isRail: true,
                      menuItems: widget.notifier.menuItemModels,
                      onItemSelected: (MenuItemModel item) {
                        widget.notifier.selectItem(item.itemId);
                      },
                    ),
                  ),

                // Container(color: Colors.blue, height: 100, width: 50),
                Expanded(
                  // flex: 5,
                  child: Container(
                    color: AppTheme().mainColor,
                    child: CoreWrapper(notifier: widget.notifier),
                  ),
                ),
                // if (isLoggedIn)
                //   MenuWidget(
                //     isRail: true,
                //     menuItems: widget.notifier.menuItemModels,
                //     onItemSelected: (MenuItemModel item) {
                //       WidgetsBinding.instance.addPostFrameCallback((_) {
                //         widget.notifier.selectItem(item.itemId);
                //       });
                //     },
                //   ),
                // Expanded(
                //   child: Container(
                //     color: AppTheme().mainColor,
                //     child: CoreWrapper(notifier: widget.notifier),
                //   ),
                // ),
                /*  Expanded(
                  child: FutureBuilder(
                    future:    widget.notifier.loadCoreData(selectedMenuItem),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('خطا: ${snapshot.error}'));
                      }
                      return coreWrapper; // CoreWrapper تنها یکبار ساخته میشه
                    },
                    // color: AppTheme().mainColor,
                 // PageLoadLoadingBuilderWidget(
                 //    key: ValueKey<String?>(widget.notifier.selectedItemId),
                 //    // ✅ این باعث می‌شود هر بار آیتم تغییر کرد، Widget ری‌بیلد شود
                 //    load: ([ProgressCallback? progress]) async {
                 //      if (widget.notifier.selectedItemId != null) {
                 //        await Future<void>.delayed(const Duration(seconds: 2));
                 //        CoreWrapper(notifier: widget.notifier);
                 //        // await widget.notifier.loadCoreData(
                 //        //     widget.notifier.selectedItemId!
                 //        // );
                 //      }
                 //      // await Future<void>.delayed(const Duration(seconds: 2));
                 //      // // return await widget.notifier.loadCoreData(widget.notifier.selectedItemId,progress);
                 //      // return widget.notifier.selectItem(widget.notifier.selectedItemId ?? '');
                 //    },
                 //    // load: ([ProgressCallback? progress]) async {
                 //    //   await Future<void>.delayed(const Duration(seconds: 2));
                 //    // },
                 //    childBuilder: (BuildContext ctx) {
                 //      return CoreWrapper(notifier: widget.notifier);
                 //    },
                 //    loadingBuilder:
                 //        (BuildContext ctx, Widget child, double? progress) {
                 //          return Center(
                 //            child: CircularProgressIndicator(value: progress),
                 //          );
                 //        },
                 //    errorBuilder:
                 //        (BuildContext ctx, Object error, Function retry) {
                 //          return Center(
                 //            child: Column(
                 //              mainAxisSize: MainAxisSize.min,
                 //              children: <Widget>[
                 //                Text('خطا در لود صفحه: $error'),
                 //                ElevatedButton(
                 //                  onPressed: retry(),
                 //                  child: const Text('تلاش مجدد'),
                 //                ),
                 //              ],
                 //            ),
                 //          );
                 //        },
                 //  ),
                ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
