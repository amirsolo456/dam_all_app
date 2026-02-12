// purchase_list_page.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/enums.dart'
    hide State;
import 'package:khatoon_container/src/core/components/complex_add_new_button/dynamic_add_new_button/dynamic_add_new_button.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/purchase_list_widget.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_shared/index.dart';

class PurchaseListPage extends StatefulWidget {
  const PurchaseListPage({super.key});

  @override
  State<PurchaseListPage> createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  final GetPurchaseMainActionsUseCase getPurchaseMainActionsUseCase =
      sl<GetPurchaseMainActionsUseCase>();
  final PurchaseBloc purchaseBloc = sl<PurchaseBloc>();
  final AppNotifier appNotifier = sl<AppNotifier>();
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!purchaseBloc.isClosed) {
        purchaseBloc.add(LoadPurchasesEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String text1 = context.l10n.invoice_buy_invoices;
    final List<ActionButtons<dynamic>> mainActions =
        getPurchaseMainActionsUseCase.execute();
    return BlocProvider<PurchaseBloc>(
      lazy: false,
      create: (BuildContext context) => purchaseBloc..add(LoadPurchasesEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text(text1)),
        body: const PurchaseListWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: DynamicAddNewButton(
          buttons: mainActions.map((ActionButtons<dynamic> action) {
            return ActionButtons<void>(
              action.title,
              action.icon,
              () => actionsClick(action),
            );
          }).toList(),
        ),
      ),
    );
  }

  FutureOr<void> actionsClick(ActionButtons<void> action) async {
    if (action.title == PageActionsTypes.edit.persianName) {
      await actionsClickEvent(
        PageActionsTypes.edit,
        BaseMasterDetailPagesOpenType.form,
      );
    }

    // if (action.title == PageActionsTypes.delete.persianName) {
    //   await actionsClickEvent(
    //     PageActionsTypes.delete,
    //     BaseMasterDetailPagesOpenType.form,
    //   );
    // }
    //
    // if (action.title == PageActionsTypes.createNew.persianName) {
    //   await actionsClickEvent(
    //     PageActionsTypes.createNew,
    //     BaseMasterDetailPagesOpenType.form,
    //   );
    // }
  }

  Future<void> actionsClickEvent(
    PageActionsTypes type,
    BaseMasterDetailPagesOpenType pType,
  ) async {
    appNotifier.navigateTo(
      MicroAppsName.purchases.name,
      arguments: MicroAppsChangingStatesModel<InvoiceType>(
        pageActionType: type,
        pageType: pType,
        pagePrivateParameters: InvoiceType.sale,
      ),
    );
  }

  void gotoPurchasePage(
    PageActionsTypes type,
    BaseMasterDetailPagesOpenType pType,
    InvoiceType invoiceType,
  ) {
    appNotifier.navigateTo(
      MicroAppsName.purchases.name,
      arguments: MicroAppsChangingStatesModel<InvoiceType>(
        pageActionType: type,
        pageType: pType,
        pagePrivateParameters: invoiceType,
      ),
    );
  }
}
