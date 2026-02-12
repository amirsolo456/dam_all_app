import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/enums.dart';
import 'package:khatoon_container/src/core/base/shared/domain/entities/field.dart';



class FieldModel extends Field {
  Widget _displayableWidget;

  FieldModel(
    super.index,
    this._displayableWidget,
    super.fieldType, {
    required FieldType fieldTyper,
    required int listIndex,
  }) {
    _displayableWidget = _getFieldObject(fieldTyper);
  }

  Widget get fieldWidget => _displayableWidget;
}

Widget _getFieldObject(FieldType F) {
  switch (F) {
    case FieldType.multiLineTextInput:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.numInput:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.dateInput:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.priceInput:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.passwordInput:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.standardDropDown:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.animateDropDown:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.avatarDropDown:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.moreVetDropDown:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.secondaryDropDown:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.standardPicker:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.imagePicker:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.tagPicker:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.timePicker:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.countPicker:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.documentPicker:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.standardSlider:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.standardRadioButton:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.animateRadioButton:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.standardCheckBox:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.animateCheckBox:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.standardButton:
      // TODO: Handle this case.
      throw UnimplementedError();
    case FieldType.textInput:
      // TODO: Handle this case.
      throw UnimplementedError();
  }
}
