/*
import 'package:dio/dio.dart';
import 'package:khatoon_container/features/menu/domain/entities/menu_item.dart';

import 'package:khatoon_container/features/menu/domain/repositories/i_menu_remote_datasource.dart';

class MenuRemoteDatasource extends IMenuRemoteDatasource {
  final Dio dio;

  MenuRemoteDatasource({required this.dio});

  @override
  Future<List<MenuItem>> getMenuItems() async {
    try {
      return (await dio.get<List<MenuItem>>('/api/menu')).data ?? <MenuItem>[];
    } on DioException catch (e) {
      throw Exception('Failed to fetch menu: ${e.message}');
    }
  }
}
*/
