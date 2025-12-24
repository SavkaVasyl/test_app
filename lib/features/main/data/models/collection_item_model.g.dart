// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionItemModel _$CollectionItemModelFromJson(Map<String, dynamic> json) =>
    CollectionItemModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      details: json['details'] == null
          ? null
          : ItemDetailsModel.fromJson(json['details'] as Map<String, dynamic>),
    );

ItemDetailsModel _$ItemDetailsModelFromJson(Map<String, dynamic> json) =>
    ItemDetailsModel(
      distillery: json['distillery'] as String,
      region: json['region'] as String,
      type: json['type'] as String,
      filled: json['filled'] as String,
      bottled: json['bottled'] as String,
    );
