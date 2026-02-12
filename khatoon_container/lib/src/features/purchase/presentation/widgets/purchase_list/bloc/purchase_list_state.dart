import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';

abstract class PurchaseListState {
  const PurchaseListState();

  List<Object> get props => <Object>[];
}

// class PurchaseListInitialState extends PurchaseListState {}
class PurchaseInitial extends PurchaseListState {}
class PurchaseListLoadingState extends PurchaseListState {}

// Loaded States
class PurchasesListLoadedDataState extends PurchaseListState {
  final List<PurchaseInvoiceModel> invoices;

  const PurchasesListLoadedDataState(this.invoices);

  @override
  List<Object> get props => <Object>[invoices];
}

class PurchaseByIdLoadedState extends PurchaseListState {
  final List<PurchaseInvoiceModel> invoice;

  const PurchaseByIdLoadedState(this.invoice);

  @override
  List<Object> get props => <Object>[invoice];
}

// class PurchaseListErrorState extends PurchaseListState {
//   final String message;
//
//   const PurchaseListErrorState(this.message);
//
//   @override
//   List<Object> get props => <Object>[message];
// }
