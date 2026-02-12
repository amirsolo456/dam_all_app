import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_info.g.dart';

@JsonSerializable()
class ContactInfo extends Equatable {
  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String phone;

  final String? email;
  final String? address;

  const ContactInfo({
    this.email,
    required this.name,
    this.address,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, phone, email, address];

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);
}
