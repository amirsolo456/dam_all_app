import 'package:khatoon_container/src/features/menu/domain/entities/menu_item.dart';

abstract class  IMenuRemoteDatasource {
  Future<List<MenuItem>> getMenuItems();
}
