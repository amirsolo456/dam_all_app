
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/core/storage/models/defaults.dart';
import 'package:khatoon_container/src/core/storage/models/filters.dart';
import 'package:khatoon_container/src/core/storage/models/order_info.dart';
import 'package:khatoon_container/src/core/storage/models/paging_info.dart';


part 'base_request.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class BaseRequest extends Equatable {
  Filters? filters;
  PagingInfo? pagingInfo;
  OrderInfo? orderInfo;
  Defaults? defaults;


  BaseRequest({this.defaults, this.orderInfo, this.filters});

  factory BaseRequest.fromJson(Map<String, dynamic> json) =>
      _$BaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRequestToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
