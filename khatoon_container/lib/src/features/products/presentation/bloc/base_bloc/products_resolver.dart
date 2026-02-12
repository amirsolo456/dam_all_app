import 'package:flutter/foundation.dart';
import 'package:khatoon_container/src/core/event_base_core/micro_core.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_local_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
import 'package:khatoon_container/src/features/products/presentation/pages/animals_product_page.dart';
import 'package:khatoon_container/src/features/products/presentation/widgets/animals_products_form_widget.dart';
import 'package:khatoon_container/index.dart';

class ProductsResolver implements MicroApp {
  @override
  void initEventListeners() {
    // CustomEventBus.on<AnimalProductsShownEvent>((event) async => {
    //  await navigatorKey.currentState?.pushNamed(Routes.products.value)
    // });

    CustomEventBus.on<AnimalProductsShownEvent>(
      (AnimalProductsShownEvent event) async => await navigatorKey.currentState
          ?.pushNamed(Routes.animalProducts.value),
    );
    // CustomEventBus.on<AnimalProductsFormShownEvent>(
    //       (AnimalProductsShownEvent event) async =>
    //   await navigatorKey.currentState?.pushNamed(Routes.animalProducts.value),
    // );
  }

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  ProductsEvents microAppEvents() => ProductsEvents();

  @override
  String get microAppName => "/${MicroAppsName.animalProducts.name}";

  // String get microAppNameForm => "/${MicroAppsName.animalFormProducts.name}";

  @override
  Widget? microAppWidget() => null;

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) =>
        AnimalsProductFormPage(onSaved: onSavedEvent),
  };

  @override
  TransitionType? get transitionType => TransitionType.fade;

  void onSavedEvent(AnimalModel? dataRow) async {
    if (dataRow == null) {
      return;
    }
    try {
      final AnimalLocalDataSource animalLocalDataSource =
          sl<AnimalLocalDataSource>();
      // final List<AnimalModel> list = <AnimalModel>[];
      // list.add(dataRow!);
      await animalLocalDataSource.addAnimal(dataRow);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
