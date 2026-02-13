import 'dart:convert';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAnimalLocalDataSource {
  Future<List<AnimalModel>> getCachedAnimals();
  Future<void> addAnimal(AnimalModel animal);
  Future<void> removeAnimal(int id); // حذف تکی با شناسه
  Future<void> clearAnimals();         // حذف همه
}

class AnimalLocalDataSource implements IAnimalLocalDataSource {
  static const String _keyAnimals = 'cached_animals';

  final SharedPreferences prefs;

  AnimalLocalDataSource({required this.prefs});

  // خواندن همه حیوانات
  @override
  Future<List<AnimalModel>> getCachedAnimals() async {
    final String? jsonString = prefs.getString(_keyAnimals);
    if (jsonString == null || jsonString.isEmpty) return <AnimalModel>[];
    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    return jsonList
        .map((dynamic e) => AnimalModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // اضافه کردن یک حیوان جدید به لیست قبلی
  @override
  Future<void> addAnimal(AnimalModel animal) async {
    final List<AnimalModel> currentAnimals = await getCachedAnimals();
    currentAnimals.add(animal);
    final String jsonString =
    json.encode(currentAnimals.map((AnimalModel a) => a.toJson()).toList());
    await prefs.setString(_keyAnimals, jsonString);
  }

  // حذف یک حیوان با id
  @override
  Future<void> removeAnimal(int id) async {
    final List<AnimalModel> currentAnimals = await getCachedAnimals();
    currentAnimals.removeWhere((AnimalModel element) => element.id == id);
    final String jsonString =
    json.encode(currentAnimals.map((AnimalModel a) => a.toJson()).toList());
    await prefs.setString(_keyAnimals, jsonString);
  }

  // حذف همه
  @override
  Future<void> clearAnimals() async {
    await prefs.remove(_keyAnimals);
  }
}
