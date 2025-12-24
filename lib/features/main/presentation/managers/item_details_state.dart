part of 'item_details_cubit.dart';

class ItemDetailsState extends Equatable {
  const ItemDetailsState({this.isLoading = false, this.item});

  final bool isLoading;
  final CollectionItemEntity? item;

  ItemDetailsState copyWith({final bool? isLoading, final CollectionItemEntity? item}) =>
      ItemDetailsState(isLoading: isLoading ?? this.isLoading, item: item ?? this.item);

  @override
  List<Object?> get props => [isLoading, item];
}
