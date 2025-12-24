import 'package:equatable/equatable.dart';

class CollectionItemEntity extends Equatable {
  const CollectionItemEntity({required this.id, required this.title, required this.image, this.details});

  final int id;
  final String title;
  final String image;
  final ItemDetailsEntity? details;

  static const empty = CollectionItemEntity(id: 0, title: '', image: '');

  @override
  List<Object?> get props => [id, title, image, details];
}

class ItemDetailsEntity extends Equatable {
  const ItemDetailsEntity(
      {required this.distillery, required this.region, required this.type, required this.filled, required this.bottled,});

  final String distillery;
  final String region;
  final String type;
  final String filled;
  final String bottled;

  @override
  List<Object?> get props => [distillery, region, type, filled, bottled];
}
