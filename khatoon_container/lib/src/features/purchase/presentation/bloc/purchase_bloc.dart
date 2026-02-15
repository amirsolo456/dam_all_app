import 'package:bloc/bloc.dart';
import 'package:khatoon_container/src/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/payment_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  // Purchase Invoice UseCases
  final GetPurchasesUseCase getPurchasesUseCase;

  // Purchase Item UseCases
  final GetPurchasesItemsByPurchaseIdUseCase getPurchasesItemsUseCase;
  final CreatePurchaseItemUseCase createPurchaseItemUseCase;
  final UpdatePurchaseItemUseCase updatePurchaseItemUseCase;
  final DeletePurchaseItemByIdUseCase deletePurchaseItemUseCase;

  // Payment UseCases
  final GetPaymentsByInvoiceIdUseCase getPaymentsUseCase;
  final CreatePaymentUseCase createPaymentUseCase;
  final CreatePaymentsUseCase createPaymentsUseCase;
  final UpdatePaymentUseCase updatePaymentUseCase;
  final DeletePaymentUseCase deletePaymentUseCase;
  final DeletePaymentsByIdUseCase deletePaymentByIdUseCase;

  PurchaseBloc({
    required this.getPurchasesUseCase,
    required this.getPurchasesItemsUseCase,
    required this.createPurchaseItemUseCase,
    required this.updatePurchaseItemUseCase,
    required this.deletePurchaseItemUseCase,
    required this.getPaymentsUseCase,
    required this.createPaymentUseCase,
    required this.createPaymentsUseCase,
    required this.updatePaymentUseCase,
    required this.deletePaymentUseCase,
    required this.deletePaymentByIdUseCase,
  }) : super(PurchaseInitial()) {
    on<LoadPurchasesEvent>(_onLoadPurchases);
    on<LoadCreatePurchasePageEvent>(_onLoadCreatePurchasePage);
    on<LoadDeletePurchasePageEvent>(_onLoadDeletePurchasePage);

    on<GetPurchaseItemsEvent>(_onGetPurchaseItems);
    on<CreatePurchaseItemEvent>(_onCreatePurchaseItem);
    on<UpdatePurchaseItemEvent>(_onUpdatePurchaseItem);
    on<DeletePurchaseItemEvent>(_onDeletePurchaseItem);

    on<GetPaymentsEvent>(_onGetPayments);
    on<CreatePaymentEvent>(_onCreatePayment);
    on<UpdatePaymentEvent>(_onUpdatePayment);
    on<DeletePaymentEvent>(_onDeletePayment);
  }

  Future<void> _onLoadPurchases(
    LoadPurchasesEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      final List<PurchaseInvoiceModel> invoices = await getPurchasesUseCase.execute();
      emit(PurchasesLoadedState(invoices));
    } catch (e) {
      emit(PurchaseErrorState('Error: ${e.toString()}'));
    }
  }

  Future<void> _onLoadCreatePurchasePage(
    LoadCreatePurchasePageEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
  }

  Future<void> _onLoadDeletePurchasePage(
    LoadDeletePurchasePageEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
  }

  Future<void> _onGetPurchaseItems(
    GetPurchaseItemsEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseItemsLoading());
    try {
      final List<PurchaseItemModel> items = await getPurchasesItemsUseCase
          .execute(event.purchase.id);
      emit(PurchaseItemsLoadedState(items));
    } catch (e) {
      emit(PurchaseErrorState('Error fetching items: ${e.toString()}'));
    }
  }

  Future<void> _onCreatePurchaseItem(
    CreatePurchaseItemEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await createPurchaseItemUseCase.execute(event.item);
      emit(PurchaseItemCreatedState(event.item));
    } catch (e) {
      emit(PurchaseErrorState('Error creating item: ${e.toString()}'));
    }
  }

  Future<void> _onUpdatePurchaseItem(
    UpdatePurchaseItemEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await updatePurchaseItemUseCase.execute(event.item);
      emit(PurchaseItemUpdatedState(event.item));
    } catch (e) {
      emit(PurchaseErrorState('Error updating item: ${e.toString()}'));
    }
  }

  Future<void> _onDeletePurchaseItem(
    DeletePurchaseItemEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await deletePurchaseItemUseCase.execute(event.item.id);
      emit(PurchaseItemDeletedState(event.item));
    } catch (e) {
      emit(PurchaseErrorState('Error deleting item: ${e.toString()}'));
    }
  }

  Future<void> _onGetPayments(
    GetPaymentsEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PaymentsLoading());
    try {
      final List<PaymentModel> payments = await getPaymentsUseCase.execute(
        event.invoice.id,
      );
      emit(PaymentsLoadedState(payments));
    } catch (e) {
      emit(PurchaseErrorState('Error fetching payments: ${e.toString()}'));
    }
  }

  Future<void> _onCreatePayment(
    CreatePaymentEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await createPaymentUseCase.execute(event.payment);
      emit(PaymentCreatedState(event.payment));
    } catch (e) {
      emit(PurchaseErrorState('Error creating payment: ${e.toString()}'));
    }
  }

  Future<void> _onUpdatePayment(
    UpdatePaymentEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await updatePaymentUseCase.execute(event.payment);
      emit(PaymentUpdatedState(event.payment));
    } catch (e) {
      emit(PurchaseErrorState('Error updating payment: ${e.toString()}'));
    }
  }

  Future<void> _onDeletePayment(
    DeletePaymentEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await deletePaymentUseCase.execute(event.payment.id);
      emit(PaymentDeletedState(event.payment));
    } catch (e) {
      emit(PurchaseErrorState('Error deleting payment: ${e.toString()}'));
    }
  }
}
