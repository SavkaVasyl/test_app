part of 'my_collection_cubit.dart';

class MyCollectionState extends Equatable {
  const MyCollectionState({
    this.isLoading = false,
    this.items = const [],
  });

  final bool isLoading;
  final List<CollectionItemEntity> items;

  MyCollectionState copyWith({
    final bool? isLoading,
    final List<CollectionItemEntity>? items,
  }) => MyCollectionState(
    isLoading: isLoading ?? this.isLoading,
    items: items ?? this.items,
  );

  @override
  List<Object?> get props => [isLoading,items];
}
