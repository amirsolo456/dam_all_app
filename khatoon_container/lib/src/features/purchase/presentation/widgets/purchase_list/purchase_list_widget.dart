import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/components/check_boxes/simple_check_box.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_card.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_list_tile.dart';
import 'package:khatoon_container/src/core/components/dialog/dialog.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_bloc.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_event.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_state.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/title_text_drop_down.dart';
import 'package:khatoon_container/index.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class PurchaseListWidget extends StatefulWidget {
  const PurchaseListWidget({super.key});

  @override
  State<PurchaseListWidget> createState() => _PurchaseListWidgetState();
}

class _PurchaseListWidgetState extends State<PurchaseListWidget> {
  final GetPurchaseMoreActionsUseCase getPurchaseMoreActionsUseCase =
      sl<GetPurchaseMoreActionsUseCase>();
  late bool showSelectionBox = false;
  final bool enabled = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final PurchaseListBloc bloc = sl<PurchaseListBloc>();
      if (!bloc.isClosed) {
        bloc.add(PurchaseListLoadingEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors =context.colors;
    final List<PopupMenuItem<dynamic>> moreActions =
        getPurchaseMoreActionsUseCase.execute();
    return BlocBuilder<PurchaseListBloc, PurchaseListState>(
      builder: (BuildContext context, PurchaseListState state) {
        // if (state is PurchaseListLoadingState) {
        //   return const Center(child: CircularProgressIndicator());
        // }

        // if (state is PurchaseListErrorState) {
        //   return Center(child: Text(state.message));
        // }

        if (state is PurchasesListLoadedDataState) {
          final List<PurchaseInvoiceModel> invoices = state.invoices;

          if (invoices.isEmpty) {
            return Center(child: Text(context.l10n.invoice_common_empty));
          }
          return ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (BuildContext context, int index) {
              final PurchaseInvoiceModel invoice = invoices[index];
              return CustomCard(
                cardShape:   RoundedRectangleBorder(
                  borderRadius: const BorderRadiusGeometry.all(Radius.circular(10)),
                  side: BorderSide(width: 0.8, color: colors.border),
                ),
                cardChild: CustomListTile(
                  enabled: enabled,
                  leading: Visibility(
                    visible: showSelectionBox,
                    child: CustomCheckbox(
                      onSelectionChanged: () {
                        setState(() {
                          invoice.isSelected = !invoice.isSelected;
                        });
                      },
                    ),
                  ),
                  title: SizedBox(
                    child: TitleTextDropDown(
                      title: '${context.l10n.invoice_invoice}  ',
                      items: moreActions,
                    ),
                  ),
                  // subtitle: Text(
                  //   maxLines: 1,
                  //   '${context.l10n.invoice_saler}: ${invoice.sellerId} - ${context.l10n.payment_amount}: ${invoice.totalAmount}',
                  // ),
                  // trailing: Chip(
                  //   mouseCursor: .defer,
                  //   label: Text(
                  //     invoice.isSettled
                  //         ? context.l10n.invoice_state_completed
                  //         : context.l10n.invoice_state_pending,
                  //     style: const TextStyle(color: Colors.white),
                  //   ),
                  //   backgroundColor: invoice.isSettled
                  //       ? Colors.lightGreen
                  //       : Colors.orange,
                  //   onDeleted: invoiceStateTabEvent,
                  // ),

                  onLongPress: () {
                    setState(() => showSelectionBox = true);
                  },
                  selected: invoice.isSelected,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  void invoiceLongPressedEvent(PurchaseInvoiceModel dataRow) {
    dataRow.isSelected = !dataRow.isSelected;
  }

  void invoiceStateTabEvent() {
    const ModernDialogs().showModernDialog(
      context,
      '',
      '',
      '',
      () {},
      PanaraDialogType.normal,
    );
  }
}
