import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_card.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/picker/customer_picker/customer_picker_dialog.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/picker/data_grids/data_grid_widget.dart';
import 'package:khatoon_container/src/core/di/injection_container.dart';
import 'package:khatoon_container/src/features/purchase/domain/repositories/i_purchase_repository.dart';
import 'package:khatoon_shared/index.dart';

class PurchaseFormWidget extends StatefulWidget {
  const PurchaseFormWidget({super.key});

  @override
  State<PurchaseFormWidget> createState() => _PurchaseFormWidgetState();
}

class _PurchaseFormWidgetState extends State<PurchaseFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PersonModel? _selectedCustomer;
  final List<PersonModel> _availableCustomers = <PersonModel>[
    PersonModel(
      1,
      name: 'مشتری ۱',
      familyName: 'نام خانوادگی ۱',
      phoneNumber: '09120000000',
      street: 'خیابان ۱',
      town: 'تهران',
      fullAddress: 'تهران، خیابان ۱',
      description: '',
      createDate: DateTime.now().millisecond,
    ),
    PersonModel(
      2,
      name: 'تامین کننده ۱',
      familyName: 'نام خانوادگی ۲',
      phoneNumber: '09121111111',
      street: 'خیابان ۲',
      town: 'تهران',
      fullAddress: 'تهران، خیابان ۲',
      description: '',
      createDate: DateTime.now().millisecond,
    ),
  ];
  List<PurchaseItemModel> _selectedItems = <PurchaseItemModel>[];

  double get _totalAmount => _selectedItems.fold(
    0.0,
    (double prev, PurchaseItemModel item) => prev + (item.unitPrice * item.quantity),
  );

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
                    : 'انتخاب مشتری/تامین‌کننده',
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

          // Purchase Items Table
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth - 16,
                height: 350,
                child: DataGridWidget(
                  onChanged: (List<PurchaseItemModel> items) {
                    setState(() {
                      _selectedItems = items;
                    });
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 16),
          // Total
          Text(
            'مبلغ کل: ${_totalAmount.toStringAsFixed(0)} تومان',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saveForm,
            child: const Text('ثبت فاکتور'),
          ),
        ],
      ),
    );
  }

  void _saveForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedCustomer == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لطفا یک مشتری انتخاب کنید')),
        );
        return;
      }
      if (_selectedItems.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لطفا حداقل یک کالا انتخاب کنید')),
        );
        return;
      }

      final Invoice invoice = Invoice(
        id: 0,
        invoiceNo: 'PUR-${DateTime.now().millisecondsSinceEpoch}',
        type: 'Purchase',
        partyId: _selectedCustomer!.id,
        date: DateTime.now(),
        totalAmount: _totalAmount,
        status: 'Open',
        version: 0,
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      try {
        await sl<IPurchaseRepository>().createInvoice(invoice);
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('فاکتور با موفقیت ثبت شد')),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطا در ثبت فاکتور: $e')),
          );
        }
      }
    }
  }
}
