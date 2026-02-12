import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:khatoon_container/src/core/base/shared/data/models/field_model.dart';

class BaseFormGeneratorWidget extends StatelessWidget {
  final List<FieldModel> fields;

  const BaseFormGeneratorWidget({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
