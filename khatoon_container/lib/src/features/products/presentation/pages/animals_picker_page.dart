// file: animals_picker_page.dart
import 'package:flutter/material.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_container/src/features/products/presentation/widgets/animals_product_widget.dart';

class AnimalsPickerPage extends StatefulWidget {
  final List<Animal> animals;
  final String title;

  const AnimalsPickerPage({
    super.key,
    required this.animals,
    this.title = 'انتخاب محصول',
  });

  @override
  State<AnimalsPickerPage> createState() => _AnimalsPickerPageState();
}

class _AnimalsPickerPageState extends State<AnimalsPickerPage> {
  List<Animal> _selected = <Animal>[];

  void _onSelectionChanged(List<Animal> sel) {
    setState(() => _selected = sel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          TextButton(
            onPressed: _selected.isEmpty
                ? null
                : () => Navigator.of(context).pop<List<Animal>>(_selected),
            child: const Text('تایید', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: AnimalsProductsWidget(
        animals:<AnimalModel>[],
        onSelectionChanged: _onSelectionChanged,
      ),
    );
  }
}
