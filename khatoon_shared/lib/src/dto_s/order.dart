import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';


part 'order.g.dart';

@JsonSerializable()
class Order {
  final int id;
  final int date;
  final int quantity;
  final double totalWeight;
  final int itemId;
  final int userId;
  final UserRank userRank;
  final double price;

  Order({
    required this.id,
    required this.date,
    required this.quantity,
    required this.totalWeight,
    required this.itemId,
    required this.userId,
    required this.userRank,
    required this.price,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  // ignore: unused_element
  static UserRank _stringToUserRank(String rank) {
    switch (rank) {
      case 'accountant':
        return UserRank.accountant;
      case 'support':
        return UserRank.support;
      case 'analyst':
        return UserRank.analyst;
      case 'developer':
        return UserRank.developer;
      case 'assistant':
        return UserRank.assistant;
      case 'user':
        return UserRank.user;
      case 'viewer':
        return UserRank.viewer;
      default:
        throw ArgumentError('Invalid user rank: $rank');
    }
  }

  // ignore: unused_element
  static String _userRankToString(UserRank rank) {
    switch (rank) {
      case UserRank.accountant:
        return 'accountant';
      case UserRank.support:
        return 'support';
      case UserRank.analyst:
        return 'analyst';
      case UserRank.developer:
        return 'developer';
      case UserRank.assistant:
        return 'assistant';
      case UserRank.user:
        return 'user';
      case UserRank.viewer:
        return 'viewer';
    }
  }

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
