import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';

abstract class   IProfileRepository {
  List<ActionButtons<dynamic>> getItems();
  void selectedItem(ActionButtons<dynamic> item);
}