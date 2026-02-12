// converters.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';
import 'package:latlong2/latlong.dart';

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(json['lat'] as double, json['lng'] as double);
  }

  @override
  Map<String, dynamic> toJson(LatLng latLng) {
    return {'lat': latLng.latitude, 'lng': latLng.longitude};
  }
}

class LatLngNullableConverter
    implements JsonConverter<LatLng?, Map<String, dynamic>?> {
  const LatLngNullableConverter();

  @override
  LatLng? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return LatLng(json['lat'] as double, json['lng'] as double);
  }

  @override
  Map<String, dynamic>? toJson(LatLng? latLng) {
    if (latLng == null) return null;
    return {'lat': latLng.latitude, 'lng': latLng.longitude};
  }
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime date) => date.toIso8601String();
}

class DateTimeNullableConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeNullableConverter();

  @override
  DateTime? fromJson(String? json) =>
      json == null ? null : DateTime.parse(json);

  @override
  String? toJson(DateTime? date) => date?.toIso8601String();
}

class SellerTypeConverter implements JsonConverter<SellerType, String> {
  const SellerTypeConverter();

  @override
  SellerType fromJson(String json) {
    return SellerType.values.firstWhere((e) => e.name == json);
  }

  @override
  String toJson(SellerType type) => type.name;
}

class VerificationStatusConverter
    implements JsonConverter<VerificationStatus, String> {
  const VerificationStatusConverter();

  @override
  VerificationStatus fromJson(String json) {
    return VerificationStatus.values.firstWhere((e) => e.name == json);
  }

  @override
  String toJson(VerificationStatus status) => status.name;
}

class MembershipLevelConverter
    implements JsonConverter<MembershipLevel, String> {
  const MembershipLevelConverter();

  @override
  MembershipLevel fromJson(String json) {
    return MembershipLevel.values.firstWhere((e) => e.name == json);
  }

  @override
  String toJson(MembershipLevel level) => level.name;
}

class GenderConverter implements JsonConverter<Gender?, String?> {
  const GenderConverter();

  @override
  Gender? fromJson(String? json) {
    if (json == null) return null;
    return Gender.values.firstWhere((e) => e.name == json);
  }

  @override
  String? toJson(Gender? gender) => gender?.name;
}
