import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_text.dart';
import 'package:khatoon_container/src/core/components/expandable_avatar/presentation/expandable_avatar.dart';
import 'package:khatoon_container/index.dart';

import 'package:provider/provider.dart';

class MainAppBarWidget extends StatefulWidget {
  const MainAppBarWidget({super.key});

  @override
  State<MainAppBarWidget> createState() => _MainAppBarWidgetState();
}

class _MainAppBarWidgetState extends State<MainAppBarWidget> {
  bool sidebarToggle = false;
  bool menuToggle = false;

  // breakpoints (approx like Tailwind)

  // ignore: unused_field
  static const double sm = 640;
  static const double lg = 1024;
  static const double xl = 1280;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final AppNotifier notifier = Provider.of<AppNotifier>(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final bool isXL = width >= xl;
        final bool _ =
            width >=
            lg; // per HTML: search hidden on small, visible on xl:block => visible from lg+
        // HTML shows search in a div hidden xl:block -> that means visible on xl and up.
        // To be flexible we show from lg; change to isXL if you want strictly only xl.
        return Container(
          width: double.infinity,
          alignment: .center,
          constraints: .fromViewConstraints(
            const .new(minHeight: 40, minWidth: 500, maxHeight: 70),
          ),
          margin: const .fromSTEB(5, 5, 5, 5),
          transformAlignment: .center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: .center,
            textDirection: .rtl,
            spacing: 20,
            mainAxisSize: .min,
            children: <Widget>[
              SizedBox(
                width: 40,
                child: IconButton(
                  iconSize: 40,
                  tooltip: 'theme',
                  onPressed: () => notifier.toggleTheme(),
                  icon: Icon(
                    notifier.themeConfig.themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    size: 20,
                  ),
                ),
              ),
              if (isXL)
                SizedBox(
                  width: 120,
                  child:
                      // const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          notifier.selectItem(
                            MicroAppsName.purchases.persianName,
                          );
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const CustomText(
                          'فاکتور فروش',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black45,
                          foregroundColor: Colors.white,
                          alignment: .centerRight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                ),

              // const SizedBox(width: 20),
              if (isXL)
                GestureDetector(
                  onTap: () {
                    // notifier.selectItem(MicroAppsName.purchases.persianName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: SizedBox(
                      height: 28,
                      child: Image.asset(
                        isDark ? 'assets/logo_dark.png' : 'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

              // Spacer between left controls and search (matches justify-between)
              // const Spacer(),
              SizedBox(
                width: isXL ? 430 : 300,
                child: _buildSearchField(context, isDark),
              ),
              const Spacer(),

              /// Icons
              IconButton(
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  // color: Colors.black45,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),

              // const SizedBox(width: 12),

              /// Avatar
              const ExpandableAvatar(),
              // const CircleAvatar(
              //   radius: 18,
              //   backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchField(BuildContext context, bool isDark) {
    return SizedBox(
      height: 44,
      child: TextField(
        style: TextStyle(
          color: isDark ? Colors.white.withAlpha(900) : Colors.grey[900],
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Colors.grey[900] : Colors.transparent,
          // contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(),
            child: Icon(
              Icons.search,
              size: 20,
              color: isDark ? Colors.grey[400] : Colors.grey[500],
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          hintText: 'Search or type command...',
          hintStyle: TextStyle(
            color: isDark ? Colors.white.withAlpha(300) : Colors.grey[400],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.withAlpha(600),
              width: 1.5,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: ElevatedButton(
              onPressed: () {
                // you can hook up shortcut or command palette open
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(56, 32),
                padding: const EdgeInsets.symmetric(),
                elevation: 0,
                backgroundColor: isDark
                    ? Colors.white.withAlpha(30)
                    : Colors.grey[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  ),
                ),
                foregroundColor: isDark ? Colors.grey[300] : Colors.grey[600],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('⌘', style: TextStyle(fontSize: 12, height: 1.0)),
                  SizedBox(width: 4),
                  Text('K', style: TextStyle(fontSize: 12, height: 1.0)),
                ],
              ),
            ),
          ),
          // to remove default suffix padding
          suffixIconConstraints: const BoxConstraints(minWidth: 72),
        ),
      ),
    );
  }
}
