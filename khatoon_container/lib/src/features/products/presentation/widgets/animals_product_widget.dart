import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/di/injection_container.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_local_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_container/src/features/products/presentation/pages/product_create_page.dart';
import 'package:khatoon_shared/index.dart';

enum ProductSort { priceAsc, priceDesc, ageAsc, ageDesc }

class AnimalsProductsWidget extends StatefulWidget {
  final List<AnimalModel> animals;
  final ValueChanged<List<AnimalModel>>? onSelectionChanged;

  const AnimalsProductsWidget({
    super.key,
    required this.animals,
    this.onSelectionChanged,
  });

  @override
  State<AnimalsProductsWidget> createState() => _AnimalsProductsPageState();
}

class _AnimalsProductsPageState extends State<AnimalsProductsWidget> {
  // state
  final Set<int> _selectedIds = <int>{};
  final String _search = '';
  AnimalType? _typeFilter;
  Gender? _genderFilter;
  ProductSort? _sort;
  int _currentPage = 1;
  int _rowsPerPage = 10;
  final bool _groupByType = true;

  // helpers
  double _priceFor(AnimalModel a) => a.purchasePrice ?? a.estimatedValue ?? 0;

  int _ageMonthsFor(AnimalModel a) => a.ageInMonths ?? 0;

  late Future<List<AnimalModel>> _animalsFuture;

  void _loadAnimals() {
    _animalsFuture = _fetchAnimalsFromLocalStorage();
  }

  Future<List<AnimalModel>> _fetchAnimalsFromLocalStorage() async {
    final List<AnimalModel> data = await sl<AnimalLocalDataSource>()
        .getCachedAnimals();
    return data;
  }

  // List<AnimalModel> get _filtered {
  //   final List<AnimalModel> list = widget.animals.where((AnimalModel a) {
  //     if (_typeFilter != null && a.type != _typeFilter) return false;
  //     if (_genderFilter != null && a.gender != _genderFilter) return false;
  //     if (_search.isNotEmpty) {
  //       final String s = _search.trim().toLowerCase();
  //       final bool matches = <String?>[a.name, a.tagNumber, a.breed]
  //           .where((String? e) => e != null)
  //           .map((String? e) => e!.toLowerCase())
  //           .any((String e) => e.contains(s));
  //       if (!matches) return false;
  //     }
  //     return true;
  //   }).toList();
  //
  //   // sorting
  //   if (_sort != null) {
  //     switch (_sort!) {
  //       case ProductSort.priceAsc:
  //         list.sort(
  //           (AnimalModel x, AnimalModel y) =>
  //               _priceFor(x).compareTo(_priceFor(y)),
  //         );
  //         break;
  //       case ProductSort.priceDesc:
  //         list.sort(
  //           (AnimalModel x, AnimalModel y) =>
  //               _priceFor(y).compareTo(_priceFor(x)),
  //         );
  //         break;
  //       case ProductSort.ageAsc:
  //         list.sort(
  //           (AnimalModel x, AnimalModel y) =>
  //               _ageMonthsFor(x).compareTo(_ageMonthsFor(y)),
  //         );
  //         break;
  //       case ProductSort.ageDesc:
  //         list.sort(
  //           (AnimalModel x, AnimalModel y) =>
  //               _ageMonthsFor(y).compareTo(_ageMonthsFor(x)),
  //         );
  //         break;
  //     }
  //   }
  //
  //   return list;
  // }

  int _totalPages(List<AnimalModel> filtered) {
    final int total = filtered.length;
    if (total == 0) return 1;
    return ((total - 1) ~/ _rowsPerPage) + 1;
  }

  // int get _totalPages {
  //   final int total = _filtered.length;
  //   if (total == 0) return 1;
  //   return ((total - 1) ~/ _rowsPerPage) + 1;
  // }

  // List<AnimalModel> get _paged {
  //   final int start = (_currentPage - 1) * _rowsPerPage;
  //   return _filtered.skip(start).take(_rowsPerPage).toList();
  // }
  List<AnimalModel> _paged(List<AnimalModel> filtered) {
    final int start = (_currentPage - 1) * _rowsPerPage;
    return filtered.skip(start).take(_rowsPerPage).toList();
  }

  List<AnimalModel> _applyFilters(List<AnimalModel> list) {
    final List<AnimalModel> filtered = list.where((AnimalModel a) {
      if (_typeFilter != null && a.type != _typeFilter) return false;
      if (_genderFilter != null && a.gender != _genderFilter) return false;
      if (_search.isNotEmpty) {
        final String s = _search.trim().toLowerCase();
        final bool matches = <String?>[a.name, a.tagNumber, a.breed]
            .where((String? e) => e != null)
            .map((String? e) => e!.toLowerCase())
            .any((String e) => e.contains(s));
        if (!matches) return false;
      }
      return true;
    }).toList();
    if (_sort != null) {
      switch (_sort!) {
        case ProductSort.priceAsc:
          filtered.sort((AnimalModel x, AnimalModel y) => _priceFor(x).compareTo(_priceFor(y)));
          break;
        case ProductSort.priceDesc:
          filtered.sort((AnimalModel x, AnimalModel y) => _priceFor(y).compareTo(_priceFor(x)));
          break;
        case ProductSort.ageAsc:
          filtered.sort((AnimalModel x, AnimalModel y) => _ageMonthsFor(x).compareTo(_ageMonthsFor(y)));
          break;
        case ProductSort.ageDesc:
          filtered.sort((AnimalModel x, AnimalModel y) => _ageMonthsFor(y).compareTo(_ageMonthsFor(x)));
          break;
      }
    }
    return filtered;
  }

  void _toggleSelect(int id, {bool? value}) {
    setState(() {
      if (value == null) {
        if (_selectedIds.contains(id)) {
          _selectedIds.remove(id);
        } else {
          _selectedIds.add(id);
        }
      } else {
        if (value) {
          _selectedIds.add(id);
        } else {
          _selectedIds.remove(id);
        }
      }
    });
    widget.onSelectionChanged?.call(
      widget.animals.where((Animal a) => _selectedIds.contains(a.id)).toList(),
    );
  }

  // void _selectAllOnPage(List<AnimalModel> animals) {
  //   setState(() {
  //     for (final AnimalModel a in animals) {
  //       _selectedIds.add(a.id);
  //     }
  //   });
  //   widget.onSelectionChanged?.call(
  //     animals
  //         .where((AnimalModel a) => _selectedIds.contains(a.id))
  //         .toList(),
  //   );
  // }


  Map<AnimalType, List<AnimalModel>> _groupByTypeMap(List<AnimalModel> list) {
    final Map<AnimalType, List<AnimalModel>> map =
    <AnimalType, List<AnimalModel>>{};
    for (final AnimalModel a in list) {
      map.putIfAbsent(a.type, () => <AnimalModel>[]).add(a);
    }
    return map;
  }

  @override
  void initState() {
    super.initState();
    _loadAnimals();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('محصولات دام'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            tooltip: 'افزودن محصول عمومی',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (_) => const ProductCreatePage()),
              );
            },
          ),
        ],
        // actions: <Widget>[
        //   IconButton(
        //     tooltip: 'انتخاب همه در صفحه',
        //     icon: const Icon(Icons.select_all),
        //     onPressed: _selectAllOnPage,
        //   ),
        //   IconButton(
        //     tooltip: 'پاک کردن انتخاب',
        //     icon: const Icon(Icons.clear_all),
        //     onPressed: _clearSelection,
        //   ),
        //   IconButton(
        //     tooltip: 'نمایش سبد',
        //     icon: const Icon(Icons.shopping_cart),
        //     onPressed: () {
        //       final List<Animal> selected = animals
        //           .where((Animal a) => _selectedIds.contains(a.id))
        //           .toList();
        //       if (kDebugMode) {
        //         print('selected: ${selected.map((Animal e) => e.tagNumber)}');
        //       }
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder<List<AnimalModel>>(
        future: _animalsFuture,
        builder: (BuildContext context, AsyncSnapshot<List<AnimalModel>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<AnimalModel> animals = snapshot.data ?? <AnimalModel>[];
          final List<AnimalModel> filtered = _applyFilters(animals);
          final List<AnimalModel> _ = _paged(filtered);
          final int totalPages = _totalPages(filtered);

          return Column(
            children: <Widget>[
              // ... سرچ، فیلتر و sort مثل قبل
              Expanded(
                child: filtered.isEmpty
                    ? const Center(child: Text('هیچ موردی یافت نشد'))
                    : _groupByType
                    ? _buildGroupedList(animals,colors)
                    : _buildSimpleList(animals,colors),
              ),
              // صفحه بندی
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                color: colors.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'نمایش ${filtered.length} مورد — صفحه $_currentPage از $totalPages',
                    ),
                    Row(
                      children: <Widget>[
                        DropdownButton<int>(
                          value: _rowsPerPage,
                          items: const <DropdownMenuItem<int>>[
                            DropdownMenuItem<int>(value: 5, child: Text('5')),
                            DropdownMenuItem<int>(value: 10, child: Text('10')),
                            DropdownMenuItem<int>(value: 20, child: Text('20')),
                          ],
                          onChanged: (int? v) => setState(() {
                            _rowsPerPage = v ?? 10;
                            _currentPage = 1;
                          }),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: _currentPage > 1
                              ? () => setState(() => _currentPage--)
                              : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: _currentPage < totalPages
                              ? () => setState(() => _currentPage++)
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      // body:
      // Column(
      //   children: <Widget>[
      //     // فیلترها و سرچ
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Row(
      //         children: <Widget>[
      //           // جستجو
      //           Expanded(
      //             child: TextField(
      //               decoration: const InputDecoration(
      //                 hintText: 'جستجو بر اساس نام، شماره گوشواره یا نژاد',
      //                 prefixIcon: Icon(Icons.search),
      //               ),
      //               onChanged: (String v) => setState(() {
      //                 _search = v;
      //                 _currentPage = 1;
      //               }),
      //             ),
      //           ),
      //           const SizedBox(width: 8),
      //           // نوع دام فیلتر
      //           DropdownButton<AnimalType?>(
      //             value: _typeFilter,
      //             hint: const Text('همه نوع‌ها'),
      //             items: <DropdownMenuItem<AnimalType?>>[
      //               const DropdownMenuItem<AnimalType?>(child: Text('همه')),
      //               ...AnimalType.values.map(
      //                 (AnimalType t) => DropdownMenuItem<AnimalType?>(
      //                   value: t,
      //                   child: Text(t.persianName),
      //                 ),
      //               ),
      //             ],
      //             onChanged: (AnimalType? v) => setState(() {
      //               _typeFilter = v;
      //               _currentPage = 1;
      //             }),
      //           ),
      //           const SizedBox(width: 8),
      //           // جنسیت فیلتر
      //           DropdownButton<Gender?>(
      //             value: _genderFilter,
      //             hint: const Text('همه جنسیت‌ها'),
      //             items: <DropdownMenuItem<Gender?>>[
      //               const DropdownMenuItem<Gender?>(child: Text('همه')),
      //               ...Gender.values.map(
      //                 (Gender g) => DropdownMenuItem<Gender?>(
      //                   value: g,
      //                   child: Text(g.persianName),
      //                 ),
      //               ),
      //             ],
      //             onChanged: (Gender? v) => setState(() {
      //               _genderFilter = v;
      //               _currentPage = 1;
      //             }),
      //           ),
      //           const SizedBox(width: 8),
      //           // sort
      //           DropdownButton<ProductSort?>(
      //             value: _sort,
      //             hint: const Text('مرتب‌سازی'),
      //             items: const <DropdownMenuItem<ProductSort?>>[
      //               DropdownMenuItem<ProductSort?>(child: Text('بدون')),
      //               DropdownMenuItem<ProductSort?>(
      //                 value: ProductSort.priceAsc,
      //                 child: Text('قیمت ↑'),
      //               ),
      //               DropdownMenuItem<ProductSort?>(
      //                 value: ProductSort.priceDesc,
      //                 child: Text('قیمت ↓'),
      //               ),
      //               DropdownMenuItem<ProductSort?>(
      //                 value: ProductSort.ageAsc,
      //                 child: Text('سن ↑'),
      //               ),
      //               DropdownMenuItem<ProductSort?>(
      //                 value: ProductSort.ageDesc,
      //                 child: Text('سن ↓'),
      //               ),
      //             ],
      //             onChanged: (ProductSort? v) => setState(() {
      //               _sort = v;
      //               _currentPage = 1;
      //             }),
      //           ),
      //           const SizedBox(width: 8),
      //           // toggle grouping
      //           IconButton(
      //             tooltip: 'گروه‌بندی',
      //             icon: Icon(_groupByType ? Icons.group_work : Icons.view_list),
      //             onPressed: () => setState(() => _groupByType = !_groupByType),
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     const Divider(height: 1),
      //
      //     // بدنه لیست (گروه‌بندی یا ساده)
      //     Expanded(
      //       child: _filtered.isEmpty
      //           ? const Center(child: Text('هیچ موردی یافت نشد'))
      //           : _groupByType
      //           ? _buildGroupedList(colors)
      //           : _buildSimpleList(colors),
      //     ),
      //
      //     // صفحه بندی
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //       color: colors.surface,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           Text(
      //             'نمایش ${_filtered.length} مورد — صفحه $_currentPage از $_totalPages',
      //           ),
      //           Row(
      //             children: <Widget>[
      //               DropdownButton<int>(
      //                 value: _rowsPerPage,
      //                 items: const <DropdownMenuItem<int>>[
      //                   DropdownMenuItem<int>(value: 5, child: Text('5')),
      //                   DropdownMenuItem<int>(value: 10, child: Text('10')),
      //                   DropdownMenuItem<int>(value: 20, child: Text('20')),
      //                 ],
      //                 onChanged: (int? v) => setState(() {
      //                   _rowsPerPage = v ?? 10;
      //                   _currentPage = 1;
      //                 }),
      //               ),
      //               IconButton(
      //                 icon: const Icon(Icons.chevron_left),
      //                 onPressed: _currentPage > 1
      //                     ? () => setState(() => _currentPage--)
      //                     : null,
      //               ),
      //               IconButton(
      //                 icon: const Icon(Icons.chevron_right),
      //                 onPressed: _currentPage < _totalPages
      //                     ? () => setState(() => _currentPage++)
      //                     : null,
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildGroupedList(List<AnimalModel> animals ,ColorScheme colors) {
    final Map<AnimalType, List<AnimalModel>> map = _groupByTypeMap(
      _paged(animals),
    );
    final List<AnimalType> keys = map.keys.toList()
      ..sort(
            (AnimalType a, AnimalType b) => a.index.compareTo(b.index),
      ); // ترتیب نوع‌ها

    return ListView(
      padding: const EdgeInsets.all(8),
      children: keys.map((AnimalType type) {
        final List<AnimalModel> items = map[type]!;
        return ExpansionTile(
          initiallyExpanded: true,
          title: Text('${type.persianName} (${items.length})'),
          children: items
              .map((AnimalModel a) => _animalTile(a, colors))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSimpleList(List<AnimalModel> animals,ColorScheme colors) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _paged(animals).length,
      itemBuilder: (BuildContext context, int idx) {
        final AnimalModel animal = _paged(animals)[idx];
        return _animalTile(animal, colors);
      },
    );
  }

  Widget _animalTile(AnimalModel a, ColorScheme colors) {
    final bool checked = _selectedIds.contains(a.id);
    final double price = _priceFor(a);
    final String ageDesc = a.ageDescription ?? '-';
    final String title = (a.name?.isNotEmpty == true)
        ? '${a.name} — ${a.breed ?? ''}'
        : '${a.type.persianName} ${a.breed ?? ''}';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: checked ? colors.primary.withAlpha(800) : colors.surface,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        leading: Checkbox(
          value: checked,
          onChanged: (bool? v) => _toggleSelect(a.id, value: v),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Wrap(
          runSpacing: 4,
          children: <Widget>[
            Text(
              'کد: ${a.tagNumber}    جنسیت: ${a.gender.persianName}    سن: $ageDesc',
            ),
            const SizedBox(height: 2),
            Text(
              'قیمت: ${price.toStringAsFixed(0)} تومان    منبع خرید: ${a.purchaseSource ?? '-'}',
            ),
          ],
        ),
        onTap: () {
          _toggleSelect(a.id);
        },
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            // نمایش جزئیات حیوان (می‌تونی صفحه جزئیات باز کنی)
            _showDetailsDialog(a);
          },
        ),
      ),
    );
  }

  void _showDetailsDialog(Animal a) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(a.name ?? a.tagNumber),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('نوع: ${a.type.persianName}'),
                Text('نژاد: ${a.breed ?? '-'}'),
                Text('جنسیت: ${a.gender.persianName}'),
                Text(
                  'تاریخ تولد: ${a.birthDate?.toLocal().toIso8601String().substring(0, 10) ?? '-'}',
                ),
                Text('سن: ${a.ageDescription ?? '-'}'),
                Text(
                  'قیمت خرید: ${a.purchasePrice?.toStringAsFixed(0) ?? '-'}',
                ),
                Text(
                  'ارزش تخمینی: ${a.estimatedValue?.toStringAsFixed(0) ?? '-'}',
                ),
                const SizedBox(height: 8),
                Text('توضیحات: ${a.notes ?? '-'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('بستن'),
            ),
          ],
        );
      },
    );
  }
}
