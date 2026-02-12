import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';
import 'package:latlong2/latlong.dart';



part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(required: true)
  final String id;
  @JsonKey(required: true)
  final String province;
  @JsonKey(required: true)
  final String city;
  final String? district;
  @JsonKey(required: true)
  final String street;
  final String? alley;
  @JsonKey(required: true)
  final String plaque;
  final String? floor;
  final String? unit;
  @JsonKey(required: true)
  final String postalCode;
  @LatLngNullableConverter()
  final LatLng? coordinates;

  Address({
    required this.province,
    required this.city,
    this.district,
    required this.street,
    this.alley,
    required this.plaque,
    this.floor,
    this.unit,
    required this.postalCode,
    this.coordinates,
    required this.id,
  });

  String get fullAddress {
    final parts = [
      province,
      city,
      if (district != null) 'منطقه $district',
      'خیابان $street',
      if (alley != null) 'کوچه $alley',
      'پلاک $plaque',
      if (floor != null) 'طبقه $floor',
      if (unit != null) 'واحد $unit',
    ];
    return parts.join('، ');
  }

  Map<String, dynamic> toMap() {
    return {
      'province': province,
      'city': city,
      'district': district,
      'street': street,
      'alley': alley,
      'plaque': plaque,
      'floor': floor,
      'unit': unit,
      'postalCode': postalCode,
      'coordinates': coordinates != null
          ? {'lat': coordinates!.latitude, 'lng': coordinates!.longitude}
          : null,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      province: map['province'] as String,
      city: map['city'] as String,
      district: map['district'] as String?,
      street: map['street'] as String,
      alley: map['alley'] as String?,
      plaque: map['plaque'] as String,
      floor: map['floor'] as String?,
      unit: map['unit'] as String?,
      postalCode: map['postalCode'] as String,
      coordinates: map['coordinates'] != null
          ? LatLng(
              map['coordinates']['lat'] as double,
              map['coordinates']['lng'] as double,
            )
          : null,
      id: '',
    );
  }
}

@JsonSerializable()
class AddressWithId extends Address {
  @JsonKey(required: true)
  final String id;
  @JsonKey(required: true)
  final String addressType;
  @JsonKey(required: true)
  final String recipientName;
  @JsonKey(required: true)
  final String recipientPhone;
  @JsonKey(defaultValue: false)
  final bool isDefaultShipping;
  @JsonKey(defaultValue: false)
  final bool isDefaultBilling;
  final String? notes;
  @JsonKey(defaultValue: false)
  final bool verified;

  AddressWithId({
    required this.id,
    required this.recipientName,
    required this.recipientPhone,
    required this.addressType,
    required String province,
    required String city,
    String? district,
    required String street,
    String? alley,
    required String plaque,
    String? floor,
    String? unit,
    required String postalCode,
    LatLng? coordinates,
    this.isDefaultShipping = false,
    this.isDefaultBilling = false,
    this.notes,
    this.verified = false,
  }) : super(
         id: id,
         province: province,
         city: city,
         district: district,
         street: street,
         alley: alley,
         plaque: plaque,
         floor: floor,
         unit: unit,
         postalCode: postalCode,
         coordinates: coordinates,
       );

  factory AddressWithId.fromJson(Map<String, dynamic> json) =>
      _$AddressWithIdFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddressWithIdToJson(this);
  /*  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'addressType': addressType,
      ...super.toMap(),
      'isDefaultShipping': isDefaultShipping,
      'isDefaultBilling': isDefaultBilling,
      'notes': notes,
      'verified': verified,
    };
  }

  factory AddressWithId.fromMap(Map<String, dynamic> map) {
    return AddressWithId(
      id: map['id'] as String,
      recipientName: map['recipientName'] as String,
      recipientPhone: map['recipientPhone'] as String,
      addressType: map['addressType'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      district: map['district'] as String?,
      street: map['street'] as String,
      alley: map['alley'] as String?,
      plaque: map['plaque'] as String,
      floor: map['floor'] as String?,
      unit: map['unit'] as String?,
      postalCode: map['postalCode'] as String,
      coordinates: map['coordinates'] != null
          ? LatLng(
              map['coordinates']['lat'] as double,
              map['coordinates']['lng'] as double,
            )
          : null,
      isDefaultShipping: map['isDefaultShipping'] as bool? ?? false,
      isDefaultBilling: map['isDefaultBilling'] as bool? ?? false,
      notes: map['notes'] as String?,
      verified: map['verified'] as bool? ?? false,
    );
  }*/
}
