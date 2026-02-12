import 'package:khatoon_container/src/core/base/common/domain/entities/enums.dart';

class Field {
  final int index;
  final FieldType fieldType;
  final String? hintMessage;
  final bool isValueRequired;
  static int _counter = 0;

  static int autoIncrement() => ++_counter;

  Field(this.fieldType, this.isValueRequired, {this.hintMessage})
      : index = autoIncrement();
}