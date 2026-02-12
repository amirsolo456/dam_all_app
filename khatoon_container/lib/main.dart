import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_container/l10n/generated/app_localizations.dart';
import 'package:khatoon_container/src/app/theme/app_theme.dart';
import 'package:khatoon_container/src/content_wrapper.dart';
import 'package:khatoon_container/src/features/app_shortcuts/presentation/short_cuts_widget.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_bloc.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

// Import your internal packages

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize core services
  try {
    await Future.wait(<Future<void>>[
      InjectionContainer.init(),
      // Hive.initFlutter(),
    ]);
  } catch (e, stackTrace) {
    debugPrintStack(stackTrace: stackTrace);
  }

  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<AppNotifier>(create: (_) => sl<AppNotifier>()),
        BlocProvider<PurchaseBloc>(create: (_) => sl<PurchaseBloc>()),
        BlocProvider<PurchaseListBloc>(create: (_) => sl<PurchaseListBloc>()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNotifier notifier = sl<AppNotifier>();

    final AppTheme themeConfig = context.select<AppNotifier, AppTheme>(
      (AppNotifier n) => n.themeConfig,
    );
    return MaterialApp(
      // key: ValueKey(themeConfig.themeMode), // ✅ جلوگیری از glitch
      home: ContentWrapper(
        notifier: notifier, // ❌ listen نکن
      ),
      title: 'Khatoon Container',
      debugShowCheckedModeBanner: false,

      // color: Colors.white,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: themeConfig.localMode,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
            if (locale == null) return supportedLocales.first;
            return supportedLocales.firstWhere(
              (Locale supported) =>
                  supported.languageCode == locale.languageCode,
              orElse: () => supportedLocales.first,
            );
          },
      themeMode: themeConfig.themeMode,
      theme: _buildTheme(themeConfig.primaryColor, Brightness.light),
      darkTheme: _buildTheme(themeConfig.primaryColor, Brightness.dark),
      shortcuts: shortcutsMap,
    );
  }

  ThemeData _buildTheme(Color seedColor, Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    return AppTheme.build(
      seedColor,
      isDark ? Brightness.dark : Brightness.light,
    );
  }
}
