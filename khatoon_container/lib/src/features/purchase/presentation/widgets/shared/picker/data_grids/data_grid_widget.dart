import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_container/src/features/products/presentation/pages/animals_picker_page.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/picker/data_grids/grid_pagionation.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/picker/data_grids/grid_toolbar.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// List<GridColumn> columns = <GridColumn>[
//   GridColumn(columnName: 'a', label: const Text('a')),
//   GridColumn(columnName: 'b', label: const Text('b')),
//   GridColumn(columnName: 'c', label: const Text('c')),
//   GridColumn(columnName: 'd', label: const Text('d')),
// ];

class DataGridWidget extends StatefulWidget {
  final List<PurchaseItemModel> initialItems;
  final List<PurchaseItemModel> availableItems;
  final ValueChanged<List<PurchaseItemModel>>? onChanged;
  final int minColumns;

  const DataGridWidget({
    super.key,
    this.initialItems = const <PurchaseItemModel>[],
    this.availableItems = const <PurchaseItemModel>[],
    this.onChanged,
    this.minColumns = 6,
  });

  @override
  State<DataGridWidget> createState() => _DataGridWidgetState();
}

class _DataGridWidgetState extends State<DataGridWidget> {
  late List<PurchaseItemModel> _items;
  int _currentPage = 1;
  int _rowsPerPage = 10;
  int? _selectedGlobalIndex;

  final List<GridColumn> _baseColumns = <GridColumn>[
    GridColumn(columnName: 'id', label: const Text('ID')),
    GridColumn(columnName: 'name', label: const Text('نام کالا')),
    GridColumn(columnName: 'quantity', label: const Text('تعداد')),
    GridColumn(columnName: 'price', label: const Text('قیمت')),
  ];

  @override
  void initState() {
    super.initState();
    _items = List<PurchaseItemModel>.from(widget.initialItems);
  }

  List<GridColumn> get _filledColumns {
    final List<GridColumn> cols = List<GridColumn>.from(_baseColumns);
    final int need = widget.minColumns - cols.length;
    if (need > 0) {
      for (int i = 0; i < need; i++) {
        cols.add(
          GridColumn(columnName: '__ph_$i', label: const SizedBox.shrink()),
        );
      }
    }
    return cols;
  }

  int get _totalPages {
    if (_items.isEmpty) return 1;
    return ((_items.length - 1) ~/ _rowsPerPage) + 1;
  }

  List<PurchaseItemModel> get _pagedItems {
    final int start = (_currentPage - 1) * _rowsPerPage;
    return _items.skip(start).take(_rowsPerPage).toList();
  }

  void _notifyParent() {
    widget.onChanged?.call(List<PurchaseItemModel>.from(_items));
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final List<GridColumn> columns = _filledColumns;
    return Container(
      // رنگ و استایل مشابه قبلی
      decoration: BoxDecoration(
        color: colors.main,
        //
        // borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: colors.border),
      ),
      child: Column(
        children: <Widget>[
          GridToolbar(
            onAdd: () async {
              final List<Animal> availableAnimals =
                  <Animal>[]; // <<< این را با لیست واقعی جایگزین کن

              final List<Animal>? picked = await Navigator.push<List<Animal>>(
                context,
                MaterialPageRoute<List<Animal>>(
                  builder: (_) => AnimalsPickerPage(animals: availableAnimals),
                ),
              );

              if (picked != null && picked.isNotEmpty) {
                setState(() {
                  // تبدیل هر Animal به PurchaseItemModel — این تابع را مطابق کانستراکتور واقعی‌ات اصلاح کن
                  for (final Animal a in picked) {
                    _items.add(_purchaseItemFromAnimal(a));
                  }
                  _currentPage = _totalPages;
                  _selectedGlobalIndex = null;
                });
                _notifyParent();
              }
              // final PurchaseItemModel? selected = await ItemPickerDialog.show(
              //   context,
              //   widget.availableItems,
              //   title: 'انتخاب کالا',
              // );
              // if (selected != null) {
              //   setState(() {
              //     _items.add(selected);
              //     _currentPage = _totalPages;
              //     _selectedGlobalIndex = null;
              //   });
              //   _notifyParent();
              // }
            },
            onEdit: () {
              if (_selectedGlobalIndex == null) return;
              if (_selectedGlobalIndex! < 0 ||
                  _selectedGlobalIndex! >= _items.length) {
                return;
              }
              // برای مثال ساده: اسم را نمایش و ویرایش نکنیم؛ می‌تونی دیالوگ ویرایش اضافه کنی
              final PurchaseItemModel item = _items[_selectedGlobalIndex!];
              if (kDebugMode) print('edit ${item.invoiceId}');
            },
            onDelete: () {
              if (_selectedGlobalIndex == null) return;
              if (_selectedGlobalIndex! < 0 ||
                  _selectedGlobalIndex! >= _items.length) {
                return;
              }
              setState(() {
                _items.removeAt(_selectedGlobalIndex!);
                _selectedGlobalIndex = null;
                if (_currentPage > _totalPages) _currentPage = _totalPages;
              });
              _notifyParent();
            },
          ),

          // header
          Container(
            color: colors.main,
            child: Row(
              children: columns.map((GridColumn col) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: colors.text,
                        fontWeight: FontWeight.bold,
                      ),
                      child: col.label,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Divider(height: 0.8, color: colors.optionalColor4),

          // body
          Expanded(
            child: _items.isEmpty
                ? Center(
                    child: Text(
                      'هیچ کالایی انتخاب نشده',
                      style: TextStyle(color: colors.text),
                    ),
                  )
                : ListView.builder(
                    itemCount: _pagedItems.length,
                    itemBuilder: (BuildContext context, int rowIndex) {
                      final int globalIndex =
                          (_currentPage - 1) * _rowsPerPage + rowIndex;
                      final PurchaseItemModel item = _pagedItems[rowIndex];
                      final bool isSelected =
                          _selectedGlobalIndex == globalIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedGlobalIndex = isSelected
                                ? null
                                : globalIndex;
                          });
                        },
                        child: Container(
                          color: isSelected
                              ? Colors.white10
                              : Colors.transparent,
                          child: Row(
                            children: <Widget>[
                              // ستون چک‌باکس
                              Checkbox(
                                value: item.isSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    item.isSelected = value ?? false;
                                  });
                                  _notifyParent();
                                },
                              ),
                              // بقیه ستون‌ها
                              ..._filledColumns.map((GridColumn col) {
                                final String value = _valueForColumn(
                                  col.columnName,
                                  item,
                                );
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      value,
                                      style: TextStyle(color: colors.text),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // pagination
          GridPagination(
            currentPage: _currentPage,
            totalPages: _totalPages,
            rowsPerPage: _rowsPerPage,
            onPageChange: (int p) {
              setState(() {
                _currentPage = p.clamp(1, _totalPages);
                _selectedGlobalIndex = null;
              });
            },
            onRowsChange: (int r) {
              setState(() {
                _rowsPerPage = r;
                _currentPage = 1;
                _selectedGlobalIndex = null;
              });
            },
          ),
        ],
      ),
    );
  }

  PurchaseItemModel _purchaseItemFromAnimal(Animal a) {
    final int id = a.id;
    final double price = (a.purchasePrice ?? a.estimatedValue ?? 0).toDouble();

    return PurchaseItemModel(
      id: 0, // Temp ID for new line
      invoiceId: 0, // Will be set by backend or before saving
      productId: null, // If it's an animal, maybe we use partyId or description?
      description: a.tagNumber,
      quantity: 1.0,
      unitPrice: price,
      lineTotal: price,
      version: 0,
      isDeleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  String _valueForColumn(String columnName, PurchaseItemModel item) {
    switch (columnName) {
      case 'id':
        return item.id.toString();
      case 'name':
        return item.description ?? 'بدون نام';
      case 'quantity':
        return item.quantity.toString();
      case 'price':
        return item.unitPrice.toStringAsFixed(2);
      default:
        return '';
    }
  }
}
