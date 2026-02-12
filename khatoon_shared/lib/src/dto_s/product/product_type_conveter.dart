import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'product_type_conveter.g.dart';

@JsonSerializable()
class AnimalTypeConverter implements JsonConverter<AnimalType, String> {
  const AnimalTypeConverter();

  @override
  AnimalType fromJson(String json) =>
      _$AnimalTypeConverterFromJson(json as Map) as AnimalType;

  @override
  String toJson(AnimalType type) =>
      (_$AnimalTypeConverterToJson(this) as AnimalTypeConverter).toJson(type);
}

class HealthStatusConverter implements JsonConverter<HealthStatus, String> {
  const HealthStatusConverter();

  @override
  HealthStatus fromJson(String json) {
    return HealthStatus.values.firstWhere((e) => e.name == json);
  }

  @override
  String toJson(HealthStatus status) => status.name;
}
