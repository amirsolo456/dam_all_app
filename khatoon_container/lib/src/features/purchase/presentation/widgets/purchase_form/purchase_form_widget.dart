import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_card.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/picker/customer_picker/customer_picker_dialog.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/picker/data_grids/data_grid_widget.dart';

class PurchaseFormWidget extends StatefulWidget {
  const PurchaseFormWidget({super.key});

  @override
  State<PurchaseFormWidget> createState() => _PurchaseFormWidgetState();
}

class _PurchaseFormWidgetState extends State<PurchaseFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: unused_field
  final FocusNode _cycleFocus = FocusNode();

  // ignore: unused_field
  final FocusNode _amountFocus = FocusNode();

  PersonModel? _selectedCustomer;
  final List<PersonModel> _availableCustomers = <PersonModel>[
    PersonModel(
      1,
      name: 'Miron',
      familyName: 'Vitold',
      phoneNumber: '09120000000',
      street: 'Street 7',
      town: 'Tehran',
      fullAddress: 'Street 7, Tehran',
      description: '',
      createDate: DateTime.now().millisecond,
    ),
    PersonModel(
      2,
      name: 'Alice',
      familyName: 'Johnson',
      phoneNumber: '09121111111',
      street: 'Street 12',
      town: 'Tehran',
      fullAddress: 'Street 12, Tehran',
      description: '',
      createDate: DateTime.now().millisecond,
    ),
  ];
  final List<PurchaseItemModel> _selectedItems = <PurchaseItemModel>[];

  double get _totalAmount => 1;

  //     _selectedItems.fold(
  //   0,
  //   (double previousValue, PurchaseItemModel element) =>
  //       previousValue + element.price * element.quantity,
  // );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Customer Selector
          CustomCard(
            cardChild: ListTile(
              title: Text(
                _selectedCustomer != null
                    ? '${_selectedCustomer?.name} ${_selectedCustomer?.familyName}'
                    : 'Select Customer',
              ),
              trailing: const Icon(Icons.person),
              onTap: () async {
                final PersonModel? customer = await CustomerPickerDialog.show(
                  context,
                  _availableCustomers,
                );
                if (customer != null) {
                  setState(() => _selectedCustomer = customer);
                }
              },
            ),
          ),
          // const SizedBox(height: 16),

          // Purchase Items Table
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth - 16, // 90٪ عرض والد
                height: 300,
                child: const DataGridWidget(),
              );
            },
          ),

          // const SizedBox(height: 16),
          // Total
          Text(
            'Total Amount: \$${_totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saveForm,
            child: const Text('Save Invoice'),
          ),
        ],
      ),
    );
  }

  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedCustomer == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a customer')),
        );
        return;
      }
      if (_selectedItems.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one product')),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Invoice Summary'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Customer: ${_selectedCustomer?.name} ${_selectedCustomer?.familyName}',
              ),
              // const SizedBox(height: 8),
              // ..._selectedItems.map(
              //   (PurchaseItemModel e) => Text(
              //     '${e.name} x${e.quantity} = \$${(e.price * e.quantity).toStringAsFixed(2)}',
              //   ),
              // ),
              const Divider(),
              Text('Total: \$${_totalAmount.toStringAsFixed(2)}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

/*
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:khatoon_container/app/constans/app_constants.dart';
import 'package:khatoon_container/app_notifier.dart';
import 'package:khatoon_container/core/base/common/domain/entities/enums.dart'
    hide State;
import 'package:khatoon_container/core/components/custom_information_card/custom_card.dart';
import 'package:khatoon_container/core/components/custom_information_card/custom_elevated_button.dart';
import 'package:khatoon_container/core/components/custom_information_card/custom_text.dart';
import 'package:khatoon_container/core/components/drop_down/more_vet.dart';
import 'package:khatoon_container/core/constants/extensions.dart';
import 'package:khatoon_container/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/shared/customer_info_widget.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/shared/invoice_info_widget.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/shared/invoice_sum_widget.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/shared/logs_page_widget.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/shared/shared_widgets.dart';
import 'package:khatoon_container/injection_container.dart';

class PurchaseFormWidget extends StatefulWidget {
  // final InvoiceType invoiceType;

  const PurchaseFormWidget({super.key});

  @override
  State<PurchaseFormWidget> createState() => _PurchaseFormWidgetState();
}

class _PurchaseFormWidgetState extends State<PurchaseFormWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GetPurchaseInvoiceTypesUseCase getPurchaseInvoiceTypesUseCase =
      sl<GetPurchaseInvoiceTypesUseCase>();
  late TabController _tabController;

  InvoiceType invoiceType = InvoiceType.sale;
  final String _customerName = 'Miron Vitold';

  // String _street = 'Street John Wick, no. 7';
  // String _city = 'San Diego';
  // String _country = 'USA';
  // String _customerId = 'Secb8a687987708744aa2690';
  final String _invoiceNumber = 'DEV-103';
  late final PersonModel _person;
  late final List<PurchaseItemModel> _items;

  // DateTime _selectedDate = DateTime(2024, 1, 31);
  // String _promotionCode = 'PROMO1';
  final double _totalAmount = 500.0;
  final String _selectedStatus = 'Canceled';

  // Order items
  final List<OrderItem> _orderItems = <OrderItem>[
    OrderItem(
      description: 'Project Points x 25',
      billingCycle: 'monthly',
      amount: 50.25,
    ),
    OrderItem(
      description: 'Freelancer Subscription x 1',
      billingCycle: 'monthly',
      amount: 5.00,
    ),
  ];

  // وضعیت‌های ممکن

  @override
  Future<void> initState() async {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // _user = (await sl<UserLocalRepository>().getUserById(0))!;
    // InvoiceSumWidget(items: const <PurchaseItemModel>[], buyer:user. , invoiceType: InvoiceType.sale, saler: sl<UserLocalRepository>().,)
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // هدر فرم
            CustomCard(
              cardChild: Padding(
                padding: const .all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropDownMenuFb1(
                      constraints: const ViewConstraints(
                        maxHeight: 240,
                        minWidth: 30,
                        minHeight: 70,
                      ),
                      alignment: .centerRight,
                      items: getPurchaseInvoiceTypesUseCase
                          .purchaseCustomActionsDataSource
                          .getPurchaseInvoiceType(),
                      icon: Row(
                        spacing: 10,
                        children: <Widget>[
                          const Icon(Icons.more_vert),
                          CustomText(invoiceType.name),
                        ],
                      ),
                      onClick: (String v) {
                        setState(() {
                          (v == InvoiceType.sale.name
                              ? invoiceType = InvoiceType.sale
                              : invoiceType = InvoiceType.buy);
                        });
                      },
                    ),
                    Text(
                      invoiceType == InvoiceType.buy
                          ? context.l10n.invoice_buy_invoices
                          : context.l10n.invoice_sale_invoices  ,
                    ),
                    CustomElevatedButton(
                      onPressed: _saveForm,
                      icon: AppConstants$StaticIcons.save,
                      title: AppConstants$StaticText.saveInvoice,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                physics: const .new(parent: .new()),
                dragStartBehavior: .down,
                controller: _tabController,
                children: <Widget>[
                  // صفحه 1: Basic Info
                  (invoiceType == InvoiceType.sale
                      ? _buildBasicInfoPage()
                      : _buildOrderItemsPage()),

                  // صفحه 2: Order Items
                  _buildOrderItemsPage(),

                  // صفحه 3: Logs
                  const LogsPageWidget(),
                ],
              ),
            ),

            // Navigation
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomElevatedButton(
                    onPressed: () =>
                        _tabController.index > 0 ? _goToPreviousPage : null,
                    icon: AppConstants$StaticIcons.back,
                    title: AppConstants$StaticText.previous,
                    backgroundColor: Colors.grey[300],
                  ),

                  Text(
                    '${AppConstants$StaticText.page} ${_tabController.index + 1} ${AppConstants$StaticText.of} 3',
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  CustomElevatedButton(
                    onPressed: () =>
                        _tabController.index < 2 ? _goToNextPage : null,
                    icon: AppConstants$StaticIcons.next,
                    title: AppConstants$StaticText.next,
                    backgroundColor: Colors.blue[600],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoPage() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      primary: true,
      shrinkWrap: true,
      keyboardDismissBehavior: .onDrag,
      children: <Widget>[
        // header
        SharedWidgets().getSectionHeader(context.l10n.invoice_customer_info),

        // Customer Information
        const CustomCard(
          cardChild: Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomerInfoWidget(),
          ),
        ),

        SharedWidgets().getSectionHeader(context.l10n.voucher_voucher_detail),
        // Invoice Details
        const InvoiceInfoWidget(),
      ],
    );
  }

  Widget _buildOrderItemsPage() {
    return InvoiceSumWidget(
      items: _items,
      buyer: _person,
      invoiceType: invoiceType,
      saler: sl<AppNotifier>().currentUser!,
    );
  }

  void onChanged(String value) {}

  void onLeaveField(PointerDownEvent event) {}

  void _goToNextPage() {
    if (_tabController.index < 2) {
      setState(() {
        _tabController.animateTo(_tabController.index + 1);

        // _tabController.index = _tabController.index++;
      });
    }
  }

  void _goToPreviousPage() {
    if (_tabController.index > 0) {
      setState(() {
        _tabController.animateTo(_tabController.index - 1);
      });
      //   _tabController.index = _tabController.index--;
      //
      //
      // if( _tabController.index == 0){
      //   setState(() {
      //     _tabController.index = 0;
      //   });
      // }
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title:   Text(context.l10n.common_form_submit),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('${context.l10n.customer_customer}: $_customerName'),
                Text('${context.l10n.invoice_invoice}: $_invoiceNumber'),
                Text('${context.l10n.invoice_totalAmount}: \$$_totalAmount'),
                Text('${context.l10n.invoice_state_status}: $_selectedStatus'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:   Text(context.l10n.common_ok  ),
            ),
          ],
        ),
      );
    }
  }

  void _addNewOrderItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:   Text(context.l10n.common_date_format ),
        content: OrderItemForm(
          onSave: (String description, String billingCycle, double amount) {
            setState(() {
              _orderItems.add(
                OrderItem(
                  description: description,
                  billingCycle: billingCycle,
                  amount: amount,
                ),
              );
            });
          },
        ),
      ),
    );
  }

  void _editOrderItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Edit Order Item'),
        content: OrderItemForm(
          initialDescription: _orderItems[index].description,
          initialBillingCycle: _orderItems[index].billingCycle,
          initialAmount: _orderItems[index].amount,
          onSave: (String description, String billingCycle, double amount) {
            setState(() {
              _orderItems[index] = OrderItem(
                description: description,
                billingCycle: billingCycle,
                amount: amount,
              );
            });
          },
        ),
      ),
    );
  }
}

// مدل‌های داده
class OrderItem {
  final String description;
  final String billingCycle;
  final double amount;

  OrderItem({
    required this.description,
    required this.billingCycle,
    required this.amount,
  });
}

class LogEntry {
  final String message;
  final String time;

  LogEntry({required this.message, required this.time});
}

class OrderItemForm extends StatefulWidget {
  final String? initialDescription;
  final String? initialBillingCycle;
  final double? initialAmount;
  final Function(String, String, double) onSave;

  const OrderItemForm({
    super.key,
    this.initialDescription,
    this.initialBillingCycle,
    this.initialAmount,
    required this.onSave,
  });

  @override
  State<OrderItemForm> createState() => _OrderItemFormState();
}

class _OrderItemFormState extends State<OrderItemForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _descriptionController;
  late TextEditingController _billingCycleController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(
      text: widget.initialDescription ?? '',
    );
    _billingCycleController = TextEditingController(
      text: widget.initialBillingCycle ?? 'monthly',
    );
    _amountController = TextEditingController(
      text: widget.initialAmount?.toString() ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter description';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _billingCycleController,
            decoration: const InputDecoration(labelText: 'Billing Cycle'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter billing cycle';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Amount (\$)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter amount';
              }
              final double? amount = double.tryParse(value);
              if (amount == null) {
                return 'Please enter a valid number';
              }
              if (amount <= 0) {
                return 'Amount must be greater than 0';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(
                      _descriptionController.text,
                      _billingCycleController.text,
                      double.parse(_amountController.text),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _billingCycleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
*/
