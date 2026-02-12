// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReview _$ProductReviewFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'userId',
      'userName',
      'rating',
      'comment',
      'date',
    ],
  );
  return ProductReview(
    id: json['id'] as String,
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    userImage: json['userImage'] as String?,
    rating: (json['rating'] as num).toDouble(),
    comment: json['comment'] as String,
    date: const DateTimeConverter().fromJson(json['date'] as String),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    isVerifiedPurchase: json['isVerifiedPurchase'] as bool? ?? false,
  );
}

Map<String, dynamic> _$ProductReviewToJson(ProductReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'rating': instance.rating,
      'comment': instance.comment,
      'date': const DateTimeConverter().toJson(instance.date),
      'images': instance.images,
      'isVerifiedPurchase': instance.isVerifiedPurchase,
    };
