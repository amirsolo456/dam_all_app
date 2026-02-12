import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/core/storage/data/repositories/i_profile_repository.dart';

class ProfileRepository implements IProfileRepository{

  @override
  List<ActionButtons<dynamic>> getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  void selectedItem(ActionButtons<dynamic> item) {
    // TODO: implement selectedItem
  }
}