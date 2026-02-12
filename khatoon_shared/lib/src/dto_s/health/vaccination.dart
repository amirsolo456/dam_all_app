import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';


part 'vaccination.g.dart';

@JsonSerializable()
class Vaccination extends Equatable {
  @JsonKey(required: true)
  final String name;

  @DateTimeConverter()
  @JsonKey(required: true)
  final DateTime date;

  @DateTimeNullableConverter()
  final DateTime? nextDueDate;

  final String? notes;

  const Vaccination({
    required this.name,
    required this.date,
    this.nextDueDate,
    this.notes,
  });

  @override
  List<Object?> get props => [name, date, nextDueDate, notes];

  factory Vaccination.fromJson(Map<String, dynamic> json) =>
      _$VaccinationFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationToJson(this);
}
