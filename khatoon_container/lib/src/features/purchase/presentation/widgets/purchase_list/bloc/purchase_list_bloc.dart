import 'package:bloc/bloc.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_event.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_state.dart';

class PurchaseListBloc extends Bloc<PurchaseListEvent, PurchaseListState> {
  final GetPurchasesUseCase getPurchasesUseCase;
  final GetPurchasesByIdUseCase getPurchasesByIdUseCase;
  final CreatePurchaseUseCase createPurchaseUseCase;
  final UpdatePurchaseUseCase updatePurchaseUseCase;
  final DeletePurchaseUseCase deletePurchaseUseCase;

  PurchaseListBloc({
    required this.getPurchasesUseCase,
    required this.getPurchasesByIdUseCase,
    required this.createPurchaseUseCase,
    required this.updatePurchaseUseCase,
    required this.deletePurchaseUseCase,
  }) : super(PurchaseInitial()) {
    on<PurchaseListLoadDataEvent>(_onLoadPurchases);
    on<GetPurchaseByIdEvent>(_onGetPurchaseById);
    on<PurchaseListLoadingEvent>(_onLoading);
  }

  Future<void> _onLoadPurchases(
      PurchaseListLoadDataEvent event,
      Emitter<PurchaseListState> emit,
      ) async {
    emit(PurchaseListLoadingState());
    try {
      final List<PurchaseInvoiceModel> invoices = await getPurchasesUseCase.execute();
      emit(PurchasesListLoadedDataState(invoices));
    } catch (e) {
      // emit error state if exists
    }
  }

  Future<void> _onGetPurchaseById(
      GetPurchaseByIdEvent event,
      Emitter<PurchaseListState> emit,
      ) async {
    emit(PurchaseListLoadingState());
    try {
      final PurchaseInvoiceModel invoice = await getPurchasesByIdUseCase.execute(event.id);
      emit(PurchaseByIdLoadedState(<PurchaseInvoiceModel>[invoice]));
    } catch (e) {
    }
  }

  Future<void> _onLoading(
      PurchaseListLoadingEvent event,
      Emitter<PurchaseListState> emit,
      ) async {
    emit(PurchaseListLoadingState());
    add(PurchaseListLoadDataEvent());
  }
}
