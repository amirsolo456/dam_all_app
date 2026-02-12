// part of 'purchase_list_bloc.dart';


abstract class PurchaseListEvent {
  const PurchaseListEvent();

  List<Object> get props => <Object>[];
}

// class PurchaseListInitialEvent extends PurchaseListEvent {}

class PurchaseListLoadingEvent extends PurchaseListEvent {}

// class PurchaseListLoadingEvent extends PurchaseListEvent {}
class PurchaseListLoadDataEvent extends PurchaseListEvent {}

class GetPurchaseByIdEvent extends PurchaseListEvent {
  final int id;

  const GetPurchaseByIdEvent(this.id);

  @override
  List<Object> get props => <Object>[id];
}

// Loaded States
// class PurchasesLoadedEvent extends PurchaseListEvent {
//     PurchasesLoadedEvent();
// }

// class PurchaseErrorEvent extends PurchaseListEvent {
//     PurchaseErrorEvent();
// }
