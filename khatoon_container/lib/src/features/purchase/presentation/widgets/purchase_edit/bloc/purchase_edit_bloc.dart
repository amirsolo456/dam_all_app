import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';

part 'purchase_edit_event.dart';
part 'purchase_edit_state.dart';

class PurchaseEditBloc extends Bloc<PurchaseEditEvent, PurchaseEditState> {
  PurchaseEditBloc() : super(PurchaseEditInitial()) {
    on<PurchaseEditEvent>((PurchaseEditEvent event, Emitter<PurchaseEditState> emit) {
      // TODO: implement event handler
    });
  }
}
