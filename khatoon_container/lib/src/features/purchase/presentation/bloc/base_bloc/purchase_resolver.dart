import 'package:flutter/foundation.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/base_bloc/purchase_inject.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/src/features/purchase/presentation/pages/purchase_edit/purchase_edit_page.dart';
import 'package:khatoon_container/src/features/purchase/presentation/pages/purchase_list/purchase_list_page.dart';
import 'package:khatoon_container/src/core/event_base_core/services/routing/routing_transitions.dart';

// ignore: unused_import
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_form/purchase_form_widget.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/purchase_list_widget.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_shared/index.dart';

class PurchaseResolver implements MicroApp {
  @override
  String get microAppName => "/${MicroAppsName.purchases.name}";

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) {
      if (args != null) {
        if (args is MicroAppsChangingStatesModel) {
          if (args.pageType == BaseMasterDetailPagesOpenType.form) {
            if (args.pageActionType == PageActionsTypes.edit) {
              try {
                // Should fetch from bloc or service
                return const PurchaseFormWidget();
              } catch (e) {
                if (kDebugMode) {
                  print(e.toString());
                }
              }
            }
            return const PurchaseFormWidget();
          } else {
            return const PurchaseListWidget();
          }
        }
        // final BaseMasterDetailPagesOpenType value =
        //     AppConstants$MasterDetailsConstants().isThisFormOrList(args);
        // if (value == BaseMasterDetailPagesOpenType.form) {

        // } else {
        //   return const PurchaseListWidget();
        // }
      }
      return const PurchaseListPage();
    },
  };

  @override
  void initEventListeners() {
    CustomEventBus.on<PurchaseCreateNewEvent>((PurchaseCreateNewEvent event) {
      // final NavigatorState? navigator = navigatorKey.currentState;
      // if (navigator == null) return;
      //
      // final Future<Object?> result = navigator.pushNamed(
      //   Routes.purchases.value,
      //   arguments: event,
      // );
      // FocusScope.of(navigator.context).unfocus();
    });

    // CustomEventBus.on<PurchaseShownEvent>((event) {
    //
    // });

    CustomEventBus.on<PurchaseDeleteEvent>((PurchaseDeleteEvent event) {});
  }

  @override
  Widget? microAppWidget() => null;

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  TransitionType? get transitionType => TransitionType.fade;

  @override
  PurchaseCustomEvents microAppEvents() => PurchaseCustomEvents();
}
