part of 'purchase_edit_bloc.dart';

@immutable
sealed class PurchaseEditEvent {
  const PurchaseEditEvent();

  List<Object> get props => <Object>[];
}

class LoadPurchasesEditEvent extends PurchaseEditEvent {}

class UpdatePurchaseInvoiceEvent extends PurchaseEditEvent {
  final PurchaseInvoiceModel invoice;

  const UpdatePurchaseInvoiceEvent(this.invoice);

  @override
  List<Object> get props => <Object>[invoice];
}
