import 'package:flutter/material.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_container/src/core/components/loadings/animated_loading.dart';

class CoreWrapper extends StatefulWidget with BaseApp {
  final AppNotifier notifier;

  CoreWrapper({super.key, required this.notifier}) {
    initialiseRouting();
  }

  @override
  State<CoreWrapper> createState() => _CoreWrapperState();

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes =>
      <String, WidgetBuilderArgs>{};

  @override
  List<MicroApp> get microApps => <MicroApp>[
    SignInResolver(),
    ProfileResolver(),
    PurchaseResolver(),
    SettingsResolver(),
    NotFoundResolver(),
    ReportsResolver(),
    ShortCutsResolver(),
    ProductsResolver(),
  ];
}

class _CoreWrapperState extends State<CoreWrapper> {
  bool _isLoading = true;
  Object? _error;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CustomLoadingAnimation());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('خطا در لود داده: $_error'),
            ElevatedButton(

              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _error = null;
                });
                _loadInitialData();
              },
              child: const Text('تلاش مجدد'),
            ),
          ],
        ),
      );
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: super.widget.generateRoute,
      initialRoute: Routes.signIn.value,
    );
  }

  @override
  void initState() {
    super.initState();
    CustomEventBus.on<UserLoggedOutEvent>(
      (UserLoggedOutEvent event) => widget.notifier.logout(),
    );

    CustomEventBus.on<UserLoggedInEvent>(
      (UserLoggedInEvent event) => widget.notifier.emit(
        RouteEvents.purchaseEvents.purchaseShownEvent('Shown'),
      ),
    );

    CustomEventBus.on<ProfileShownEvent>(
      (ProfileShownEvent event) =>
          widget.notifier.navigateTo(Routes.profile.value, arguments: event),
    );

    CustomEventBus.on<UserShownEvent>(
      (UserShownEvent event) => widget.notifier.emit(event),
    );

    CustomEventBus.on<PurchaseShownEvent>(
      (PurchaseShownEvent event) =>
          widget.notifier.navigateTo(Routes.purchases.value, context: context),
    );

    CustomEventBus.on<PurchaseCreateNewEvent>((PurchaseCreateNewEvent event) {
      final Object? _ = navigatorKey.currentState?.pushNamed(
        Routes.purchases.value,
        arguments: event,
      );
      FocusScope.of(context).unfocus();
    });
    CustomEventBus.on<F12_ShortCutEvent>(
      (SettingsShownEvent event) => widget.notifier.emit(event),
    );

    CustomEventBus.on<SettingsShownEvent>(
      (SettingsShownEvent event) => widget.notifier.emit(event),
    );

    CustomEventBus.on<ReportsInitialEvents>(
      (ReportsInitialEvents event) =>
          widget.notifier.navigateTo(Routes.reports.value, context: context),
    );
    _loadInitialData();
    // CustomEventBus.on<AnimalProductsFormShownEvent>(
    //       (ReportsInitialEvents event) =>
    //       widget.notifier.navigateTo(Routes.animalProductsForm.value),
    // );
  }

  Future<void> _loadInitialData() async {
    try {
      // مثال: لود منو یا داده اولیه
      await widget.notifier.loadCoreData('home');
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e;
      });
    }
  }
}
