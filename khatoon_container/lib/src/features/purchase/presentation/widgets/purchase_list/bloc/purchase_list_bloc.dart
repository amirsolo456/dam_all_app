import 'package:bloc/bloc.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_event.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_state.dart';

// part 'purchase_list_event.dart';
//
// part 'purchase_list_state.dart';

class PurchaseListBloc extends Bloc<PurchaseListEvent, PurchaseListState> {
  // Purchase Invoice UseCases
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
    // on<PurchaseListErrorState>(_onPurchaseLoading);
  }

  Future<void> _onLoadPurchases(
    PurchaseListLoadDataEvent event,
    Emitter<PurchaseListState> emit,
  ) async {
    emit(PurchaseListLoadingState());
    try {
      //final invoices = await getPurchasesUseCase.execute();

      final List<PurchaseInvoiceModel> invoices = fakeJsonList
          .map((Map<String, Object> j) => PurchaseInvoiceModel.fromJson(j))
          .toList();
      emit(PurchasesListLoadedDataState(invoices));
    } catch (e) {
      // emit(PurchaseListErrorState('خطا در بارگذاری فاکتورها: ${e.toString()}'));
    }
  }

  Future<void> _onGetPurchaseById(
    GetPurchaseByIdEvent event,
    Emitter<PurchaseListState> emit,
  ) async {
    emit(PurchaseListLoadingState());
    try {

      final List<PurchaseInvoiceModel> invoice = await getPurchasesByIdUseCase
          .execute(event.id);
      emit(PurchaseByIdLoadedState(invoice));
    } catch (e) {
      // emit(PurchaseListErrorState('خطا در دریافت فاکتور: ${e.toString()}'));
    }
  }

  Future<void> _onLoading(
    PurchaseListLoadingEvent event,
    Emitter<PurchaseListState> emit,
  ) async {
    emit(PurchaseListLoadingState());
    final List<PurchaseInvoiceModel> invoices = fakeJsonList
        .map((Map<String, Object> j) => PurchaseInvoiceModel.fromJson(j))
        .toList();
    emit(PurchasesListLoadedDataState(invoices));

    // emit(PurchaseListLoadingState());
    // try {
    //   final List<PurchaseInvoiceModel> invoice = await getPurchasesByIdUseCase
    //       .execute(event.id);
    //   emit(PurchaseByIdLoadedState(invoice));
    // } catch (e) {
    //   emit(PurchaseListErrorState('خطا در دریافت فاکتور: ${e.toString()}'));
    // }
  }
}

final List<Map<String, Object>> fakeJsonList = <Map<String, Object>>[
  <String, Object>{
    "id": 1,
    "sellerId": "seller_001",
    "SellerName": "شرکت تامین قطعات پلیمری",
    "notes": "صورتحساب خرید فصل اول 1403",
    "date": 1735070400000,
    "Status": 1,
    "totalAmount": 75000000.0,
    "paidAmount": 50000000.0,
    "paymentStatus": "partial",
    "deliveryStatus": "shipped",
    "isSettled": false,
    "Deliveries": <Map<String, num>>[
      <String, num>{
        "id": 101,
        "date": 1735156800000,
        "count": 1500,
        "totalWeight": 12500.5,
      },
      <String, num>{
        "id": 102,
        "date": 1735243200000,
        "count": 800,
        "totalWeight": 6800.75,
      },
    ],
    "Items": <Map<String, Object>>[
      <String, Object>{
        "id": 201,
        "name": "لوله PVC فشار قوی سایز 20",
        "quantity": 5000,
        "price": 8500.0,
      },
      <String, Object>{
        "id": 202,
        "name": "لوله PVC فشار قوی سایز 25",
        "quantity": 3000,
        "price": 12500.0,
      },
      <String, Object>{
        "id": 203,
        "name": "اتصال سه راهی 20*20*20",
        "quantity": 2000,
        "price": 3500.0,
      },
    ],
    "Payments": <Map<String, Object>>[
      <String, Object>{
        "id": 301,
        "date": 1735070400000,
        "method": "کارت به کارت",
        "sellerId": "seller_001",
        "sellerName": "شرکت تامین قطعات پلیمری",
        "status": 1,
        "totalAmount": 30000000.0,
        "paidAmount": 30000000.0,
        "paymentStatus": "paid",
        "deliveryStatus": "pending",
        "isSettled": true,
        "notes": "پیش پرداخت اولیه",
        "Deliveries": <dynamic>[],
        "Items": <dynamic>[],
        "Payments": <dynamic>[],
      },
      <String, Object>{
        "id": 302,
        "date": 1735339200000,
        "method": "چک 3 ماهه",
        "sellerId": "seller_001",
        "sellerName": "شرکت تامین قطعات پلیمری",
        "status": 0,
        "totalAmount": 45000000.0,
        "paidAmount": 20000000.0,
        "paymentStatus": "partial",
        "deliveryStatus": "pending",
        "isSettled": false,
        "notes": "چک باقیمانده",
        "Deliveries": <dynamic>[],
        "Items": <dynamic>[],
        "Payments": <dynamic>[],
      },
    ],
  },
  <String, Object>{
    "id": 2,
    "sellerId": "seller_002",
    "SellerName": "کارخانه تولید واشرهای صنعتی",
    "notes": "خرید عمده واشرهای آب بندی",
    "date": 1735425600000,
    "Status": 2,
    "totalAmount": 42000000.0,
    "paidAmount": 42000000.0,
    "paymentStatus": "paid",
    "deliveryStatus": "delivered",
    "isSettled": true,
    "Deliveries": <Map<String, num>>[
      <String, num>{
        "id": 103,
        "date": 1735512000000,
        "count": 25000,
        "totalWeight": 1250.0,
      },
    ],
    "Items": <Map<String, Object>>[
      <String, Object>{
        "id": 204,
        "name": "واشر لاستیکی سایز 1/2 اینچ",
        "quantity": 10000,
        "price": 2500.0,
      },
      <String, Object>{
        "id": 205,
        "name": "واشر لاستیکی سایز 3/4 اینچ",
        "quantity": 8000,
        "price": 2800.0,
      },
      <String, Object>{
        "id": 206,
        "name": "واشر لاستیکی سایز 1 اینچ",
        "quantity": 7000,
        "price": 3200.0,
      },
    ],
    "Payments": <Map<String, Object>>[
      <String, Object>{
        "id": 303,
        "date": 1735425600000,
        "method": "نقدی",
        "sellerId": "seller_002",
        "sellerName": "کارخانه تولید واشرهای صنعتی",
        "status": 2,
        "totalAmount": 42000000.0,
        "paidAmount": 42000000.0,
        "paymentStatus": "paid",
        "deliveryStatus": "delivered",
        "isSettled": true,
        "notes": "پرداخت کامل نقدی",
        "Deliveries": <dynamic>[],
        "Items": <dynamic>[],
        "Payments": <dynamic>[],
      },
    ],
  },
  <String, Object>{
    "id": 3,
    "sellerId": "seller_003",
    "SellerName": "واحد تولیدی شیرآلات صنعتی",
    "notes": "",
    "date": 1735598400000,
    "Status": 0,
    "totalAmount": 18500000.0,
    "paidAmount": 0.0,
    "paymentStatus": "unpaid",
    "deliveryStatus": "pending",
    "isSettled": false,
    "Deliveries": <dynamic>[],
    "Items": <Map<String, Object>>[
      <String, Object>{
        "id": 207,
        "name": "شیر توپی تمام برنجی 1 اینچ",
        "quantity": 500,
        "price": 25000.0,
      },
      <String, Object>{
        "id": 208,
        "name": "شیر توپی تمام برنجی 1/2 اینچ",
        "quantity": 800,
        "price": 18000.0,
      },
    ],
    "Payments": <dynamic>[],
  },
];
