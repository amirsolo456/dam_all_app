import 'dart:async';
import 'dart:convert';


import 'package:khatoon_container/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IMicroAppsDataSource {
  FutureOr<List<MicroAppModel>> getMicroAppModel();

  FutureOr<bool> addMicroAppModel(MicroAppModel microAppModel);

  FutureOr<bool> updateMicroAppModel(MicroAppModel microAppModel);

  FutureOr<bool> deleteeMicroAppModel(MicroAppsName microAppModel);
}

class MicroAppsDataSource implements IMicroAppsDataSource {
  final SharedPreferences sharedPreferences;

  MicroAppsDataSource({required this.sharedPreferences});

  @override
  FutureOr<bool> addMicroAppModel(MicroAppModel microAppModel) async {
    final String value = json.encode(microAppModel.toJson());
    return await sharedPreferences.setString('a', value);
  }

  @override
  FutureOr<bool> deleteeMicroAppModel(MicroAppsName microAppModel) async {
    return await sharedPreferences.remove('a');
  }

  @override
  FutureOr<List<MicroAppModel>> getMicroAppModel() {
    final String value = sharedPreferences.getString('a') ?? '';
    final List<dynamic> jsonList = json.decode(value);
    return jsonList
        .map((dynamic json) => MicroAppModel.fromJson(json))
        .toList();
  }

  @override
  FutureOr<bool> updateMicroAppModel(MicroAppModel microAppModel) async {
    await sharedPreferences.remove('a');
    return await addMicroAppModel(microAppModel);
  }
}
