import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';

part 'collection_item_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CollectionItemModel extends CollectionItemEntity {
  const CollectionItemModel({required super.id, required super.title, required super.image,  ItemDetailsModel? super.details});

  factory CollectionItemModel.fromJson(final Map<String, dynamic> json) => _$CollectionItemModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ItemDetailsModel extends ItemDetailsEntity {
  const ItemDetailsModel({
    required super.distillery,
    required super.region,
    required super.type,
    required super.filled,
    required super.bottled,
  });

  factory ItemDetailsModel.fromJson(final Map<String, dynamic> json) => _$ItemDetailsModelFromJson(json);
}
