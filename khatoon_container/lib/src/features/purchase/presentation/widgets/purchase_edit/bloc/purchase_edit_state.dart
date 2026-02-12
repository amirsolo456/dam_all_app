part of 'purchase_edit_bloc.dart';

@immutable
abstract class PurchaseEditState {
  const PurchaseEditState();

  List<Object> get props => <Object>[];
}

final class PurchaseEditInitial extends PurchaseEditState {}

// Loading States
class PurchaseEditLoading extends PurchaseEditState {}

class PurchaseEditShownState extends PurchaseEditState {
  final PurchaseInvoiceModel purchase;

  const PurchaseEditShownState(this.purchase);

  @override
  List<Object> get props => <Object>[purchase.id];
}

class PurchaseEditUpdateState extends PurchaseEditState {}

class PurchaseEditSuccessState extends PurchaseEditState {}

class PurchaseEditFailedState extends PurchaseEditState {}
