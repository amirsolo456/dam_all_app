import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';


part 'product_status_converter.g.dart';

@JsonSerializable()
class ProductStatusConverter
    implements JsonConverter<ReproductionStatus, String> {
  const ProductStatusConverter();

  @override
  ReproductionStatus fromJson(String json) =>
      _$ProductStatusConverterFromJson(json as Map) as ReproductionStatus;

  @override
  String toJson(ReproductionStatus status) =>
      _$ProductStatusConverterToJson(this).toString();
}
