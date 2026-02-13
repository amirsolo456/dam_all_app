import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/section_card.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_shared/index.dart';

class AnimalsProductFormPage extends StatefulWidget {
  final AnimalModel? initial;
  final ValueChanged<AnimalModel>? onSaved;

  const AnimalsProductFormPage({super.key, this.initial, this.onSaved});

  @override
  State<AnimalsProductFormPage> createState() => _AnimalsProductFormPageState();
}

class _AnimalsProductFormPageState extends State<AnimalsProductFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _tagController;
  late final TextEditingController _breedController;
  late final TextEditingController _purchasePriceController;
  late final TextEditingController _estimatedValueController;
  late final TextEditingController _purchaseSourceController;
  late final TextEditingController _notesController;

  // focus nodes for Enter -> next behavior
  late final FocusNode _nameFocus;
  late final FocusNode _tagFocus;
  late final FocusNode _breedFocus;
  late final FocusNode _typeFocus;
  late final FocusNode _genderFocus;
  late final FocusNode _birthDateFocus;
  late final FocusNode _purchasePriceFocus;
  late final FocusNode _estimatedValueFocus;
  late final FocusNode _notesFocus;
  late final FocusNode _purchaseSourceFocus;
  late final FocusNode _healthFocus;
  late final FocusNode _reproductionFocus;

  AnimalType? _type;
  Gender? _gender;
  DateTime? _birthDate;
  HealthStatus? _healthStatus;
  ReproductionStatus? _reproductionStatus;

  @override
  void initState() {
    super.initState();
    final Animal? a = widget.initial;
    _nameController = TextEditingController(text: a?.name ?? '');
    _tagController = TextEditingController(text: a?.tagNumber ?? '');
    _breedController = TextEditingController(text: a?.breed ?? '');
    _purchasePriceController = TextEditingController(
      text: a?.purchasePrice != null ? a!.purchasePrice!.toString() : '',
    );
    _estimatedValueController = TextEditingController(
      text: a?.estimatedValue != null ? a!.estimatedValue!.toString() : '',
    );
    _purchaseSourceController = TextEditingController(
      text: a?.purchaseSource ?? '',
    );
    _notesController = TextEditingController(text: a?.notes ?? '');
    _healthStatus = a?.healthStatus ?? HealthStatus.good;
    _reproductionStatus = a?.reproductionStatus ?? ReproductionStatus.notReady;

    _type = a?.type;
    _gender = a?.gender;
    _birthDate = a?.birthDate;

    // init focus nodes
    _nameFocus = FocusNode();
    _tagFocus = FocusNode();
    _breedFocus = FocusNode();
    _typeFocus = FocusNode();
    _genderFocus = FocusNode();
    _birthDateFocus = FocusNode();
    _purchasePriceFocus = FocusNode();
    _estimatedValueFocus = FocusNode();
    _notesFocus = FocusNode();
    _purchaseSourceFocus = FocusNode();
    _healthFocus = FocusNode();
    _reproductionFocus = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    _breedController.dispose();
    _purchasePriceController.dispose();
    _estimatedValueController.dispose();
    _purchaseSourceController.dispose();
    _notesController.dispose();

    _nameFocus.dispose();
    _tagFocus.dispose();
    _breedFocus.dispose();
    _typeFocus.dispose();
    _genderFocus.dispose();
    _birthDateFocus.dispose();
    _purchasePriceFocus.dispose();
    _estimatedValueFocus.dispose();
    _notesFocus.dispose();
    _purchaseSourceFocus.dispose();
    _healthFocus.dispose();
    _reproductionFocus.dispose();

    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    FocusManager.instance.primaryFocus?.unfocus();

    final int id =
        widget.initial?.id ?? DateTime.now().millisecondsSinceEpoch  ;

    final double? purchasePrice = double.tryParse(
      _purchasePriceController.text.trim(),
    );
    final double? estimatedValue = double.tryParse(
      _estimatedValueController.text.trim(),
    );

    final AnimalModel result = AnimalModel(
      id: id,
      name: _nameController.text.isEmpty ? null : _nameController.text,
      tagNumber: _tagController.text.trim().isEmpty
          ? ''
          : _tagController.text.trim(),
      breed: _breedController.text.trim().isEmpty
          ? null
          : _breedController.text.trim(),
      type: _type ?? AnimalType.sheep,
      gender: _gender ?? Gender.male,
      birthDate: _birthDate,
      purchasePrice: purchasePrice,
      estimatedValue: estimatedValue,
      purchaseSource: _purchaseSourceController.text.trim().isEmpty
          ? null
          : _purchaseSourceController.text.trim(),
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      healthStatus: .good,

      createdAt: DateTime.now(),
    );

    widget.onSaved?.call(result);
    // Navigator.of(context).pop(result);
  }

  // helper to move focus to next
  void _focusNext(FocusNode next) => FocusScope.of(context).requestFocus(next);

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: .all(Radius.circular(5)),
        ),
        forceMaterialTransparency: true,
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        title: Text(widget.initial == null ? 'محصول جدید' : 'ویرایش محصول'),
        actions: <Widget>[
          IconButton(
            tooltip: 'ذخیره',
            icon: const Icon(Icons.save),
            onPressed: _save,
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            // padding: const EdgeInsets.all(4),
            children: <Widget>[
              SectionCard(
                child: Column(
                  spacing: 12,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => _focusNext(_tagFocus),
                      decoration: const InputDecoration(
                        labelText: 'نام دام',
                        prefixIcon: Icon(Icons.badge_outlined),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextFormField(
                      controller: _tagController,
                      focusNode: _tagFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => _focusNext(_breedFocus),
                      decoration: const InputDecoration(
                        labelText: 'شماره گوشواره',
                        prefixIcon: Icon(Icons.qr_code),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextFormField(
                      controller: _breedController,
                      focusNode: _breedFocus,
                      textInputAction: TextInputAction.next,

                      onFieldSubmitted: (_) => _openTypeSelector(),
                      // 👈 این خط
                      decoration: const InputDecoration(
                        labelText: 'نژاد',
                        prefixIcon: Icon(Icons.pets),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24, width: 24),
              SectionCard(
                child: Column(
                  spacing: 12,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Focus(
                            focusNode: _typeFocus,
                            onKeyEvent: (FocusNode node, KeyEvent event) {
                              if (event is KeyDownEvent &&
                                  _isNextKey(event.logicalKey)) {
                                _openTypeSelector();
                                return KeyEventResult.handled;
                              }
                              return KeyEventResult.ignored;
                            },
                            child: InkWell(
                              onTap: _openTypeSelector,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'نوع دام',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),

                                child: Text(
                                  _type?.persianName ?? 'انتخاب کنید',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Focus(
                            focusNode: _healthFocus,
                            onKeyEvent: (FocusNode node, KeyEvent event) {
                              if (event is KeyDownEvent &&
                                  _isNextKey(event.logicalKey)) {
                                _openHealthSelector();
                                return KeyEventResult.handled;
                              }
                              return KeyEventResult.ignored;
                            },
                            child: InkWell(
                              onTap: _openHealthSelector,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'وضعیت سلامت',
                                ),
                                child: Text(
                                  _healthStatus?.persianName ?? 'انتخاب کنید',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Focus(
                            focusNode: _reproductionFocus,
                            onKeyEvent: (FocusNode node, KeyEvent event) {
                              if (event is KeyDownEvent &&
                                  _isNextKey(event.logicalKey)) {
                                _openReproductionSelector();
                                return KeyEventResult.handled;
                              }
                              return KeyEventResult.ignored;
                            },
                            child: InkWell(
                              onTap: _openReproductionSelector,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'وضعیت تولیدمثل',
                                ),
                                child: Text(
                                  _reproductionStatus?.persianName ??
                                      'انتخاب کنید',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Focus(
                            focusNode: _genderFocus,
                            onKeyEvent: (FocusNode node, KeyEvent event) {
                              if (event is KeyDownEvent &&
                                  _isNextKey(event.logicalKey)) {
                                _openGenderSelector();
                                return KeyEventResult.handled;
                              }
                              return KeyEventResult.ignored;
                            },
                            child: InkWell(
                              onTap: _openGenderSelector,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'جنسیت',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                child: Text(
                                  _gender?.persianName ?? 'انتخاب کنید',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // const SizedBox(height: 12),
                    Focus(
                      focusNode: _birthDateFocus,
                      onKeyEvent: (FocusNode node, KeyEvent event) {
                        if (event is KeyDownEvent &&
                            _isNextKey(event.logicalKey)) {
                          _pickBirthDate();
                          return KeyEventResult.handled;
                        }
                        return KeyEventResult.ignored;
                      },
                      child: InkWell(
                        onTap: _pickBirthDate,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'تاریخ تولد',
                            prefixIcon: Icon(Icons.cake_outlined),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          child: Text(
                            _birthDate == null
                                ? 'انتخاب نشده'
                                : _birthDate!
                                      .toLocal()
                                      .toIso8601String()
                                      .substring(0, 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24, width: 24),
              SectionCard(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _purchasePriceController,
                      focusNode: _purchasePriceFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => _focusNext(_estimatedValueFocus),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'قیمت خرید (تومان)',
                        prefixIcon: Icon(Icons.attach_money),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _estimatedValueController,
                      focusNode: _estimatedValueFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => _focusNext(_notesFocus),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'ارزش تخمینی (تومان)',
                        prefixIcon: Icon(Icons.trending_up),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24, width: 24),
              SectionCard(
                child: TextFormField(
                  controller: _notesController,
                  focusNode: _notesFocus,
                  maxLines: 4,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _save(),
                  decoration: const InputDecoration(
                    labelText: 'یادداشت‌ها',
                    alignLabelWithHint: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24, width: 24),
              // const SizedBox(height: 24),
              SectionCard(
                child: Padding(
                  padding: const .all(5),
                  child: ElevatedButton.icon(
                    onPressed: _save,
                    icon: const Icon(Icons.save),
                    label: const Text('ذخیره محصول'),
                    style: ElevatedButton.styleFrom(
                      padding: const .only(top: 15, bottom: 15),
                      backgroundColor: colors.secondary,
                      textStyle: const TextStyle(fontSize: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: .all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isNextKey(LogicalKeyboardKey key) {
    return key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter ||
        key == LogicalKeyboardKey.tab ||
        key == LogicalKeyboardKey.arrowDown;
  }

  void _openTypeSelector() async {
    final AnimalType? picked = await _selectFromList<AnimalType>(
      'نوع دام را انتخاب کنید',
      AnimalType.values,
      _type,
      (AnimalType e) => e.persianName,
    );

    if (picked != null) {
      _type = picked;
      _focusNext(_genderFocus);
    }
  }

  void _openHealthSelector() async {
    final HealthStatus? picked = await _selectFromList<HealthStatus>(
      'وضعیت سلامت',
      HealthStatus.values,
      _healthStatus,
      (HealthStatus e) => e.persianName,
    );
    if (picked != null) {
      _healthStatus = picked;
      _focusNext(_reproductionFocus);
    }
  }

  void _openReproductionSelector() async {
    final ReproductionStatus? picked = await _selectFromList<ReproductionStatus>(
      'وضعیت تولیدمثل',
      ReproductionStatus.values,
      _reproductionStatus,
      (ReproductionStatus e) => e.persianName,
    );
    if (picked != null) {
      _reproductionStatus = picked;
      _focusNext(_notesFocus);
    }
  }

  void _openGenderSelector() async {
    final Gender? picked = await _selectFromList<Gender>(
      'جنسیت را انتخاب کنید',
      Gender.values,
      _gender,
      (Gender e) => e.persianName,
    );

    if (picked != null) {
      _gender = picked;
      _focusNext(_birthDateFocus);
    }
  }

  Future<void> _pickBirthDate() async {
    final DateTime now = DateTime.now();
    final DateTime first = DateTime(now.year - 20);
    final DateTime last = DateTime(now.year + 1);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? now,
      firstDate: first,
      lastDate: last,
      locale: const Locale('fa'),
    );

    if (picked != null) {
      _birthDate = picked;

      _focusNext(_purchasePriceFocus);
    }
  }

  Future<T?> _selectFromList<T>(
    String title,
    List<T> items,
    T? selected,
    String Function(T) labelFn,
  ) async {
    if (items.isEmpty) return null;

    final ScrollController scrollController = ScrollController();
    int selectedIndex = selected != null ? items.indexOf(selected) : 0;
    if (selectedIndex < 0) selectedIndex = 0;

    final FocusNode focusNode = FocusNode();

    bool didInit = false; // <- مهم: از ثبت چندباره جلوگیری می‌کنه

    final T? result = await showDialog<T>(
      context: context,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (BuildContext ctx, StateSetter setState) {
            void scrollToSelected({bool animated = false}) {
              if (!scrollController.hasClients) return;
              const double itemHeight = 56.0;
              final double offset =
                  (selectedIndex * itemHeight) - (itemHeight * 2);
              final double safeOffset = offset.clamp(
                scrollController.position.minScrollExtent,
                scrollController.position.maxScrollExtent,
              );

              // هنگام init از jumpTo استفاده کن (بدون انیمیشن)
              if (!animated) {
                scrollController.jumpTo(safeOffset);
              } else {
                // قبل از animate بررسی کن که فاصله معناداری وجود داره
                if ((scrollController.offset - safeOffset).abs() > 1.0) {
                  scrollController.animateTo(
                    safeOffset,
                    duration: const Duration(milliseconds: 120),
                    curve: Curves.easeInOut,
                  );
                }
              }
            }

            // register post-frame callback only once
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (didInit) return;
              didInit = true;
              if (!focusNode.hasFocus) focusNode.requestFocus();
              // initial position without animation
              scrollToSelected();
            });

            return KeyboardListener(
              focusNode: focusNode,
              onKeyEvent: (KeyEvent raw) {
                if (raw is KeyDownEvent) {
                  final LogicalKeyboardKey key = raw.logicalKey;
                  if (key == LogicalKeyboardKey.arrowDown) {
                    setState(() {
                      selectedIndex = (selectedIndex + 1) % items.length;
                    });
                    scrollToSelected(animated: true);
                  } else if (key == LogicalKeyboardKey.arrowUp) {
                    setState(() {
                      selectedIndex = (selectedIndex - 1) < 0
                          ? items.length - 1
                          : (selectedIndex - 1);
                    });
                    scrollToSelected(animated: true);
                  } else if (key == LogicalKeyboardKey.enter ||
                      key == LogicalKeyboardKey.numpadEnter) {
                    Navigator.of(ctx).pop(items[selectedIndex]);
                  } else if (key == LogicalKeyboardKey.escape) {
                    Navigator.of(ctx).pop();
                  }
                }
              },
              child: AlertDialog(
                title: Text(title),
                content: SizedBox(
                  width: double.maxFinite,
                  child: Scrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    child: ListView.separated(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: items.length,
                      separatorBuilder: (_, _) => const Divider(height: 1),
                      itemBuilder: (_, int idx) {
                        final T item = items[idx];
                        final bool isSel = idx == selectedIndex;
                        return ListTile(
                          title: Text(labelFn(item)),
                          selected: isSel,
                          selectedTileColor: Theme.of(
                            context,
                          ).colorScheme.primary.withAlpha(120),
                          onTap: () => Navigator.of(ctx).pop(item),
                          onLongPress: () => Navigator.of(ctx).pop(item),
                        );
                      },
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('انصراف'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(ctx).pop(items[selectedIndex]),
                    child: const Text('تایید'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    // cleanup
    try {
      scrollController.dispose();
    } catch (_) {}
    try {
      focusNode.dispose();
    } catch (_) {}

    return result;
  }
}
