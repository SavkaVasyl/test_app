import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/managers/base_cubit.dart';
import 'package:test_app/features/main/data/repository/collection_repository.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';

part 'item_details_state.dart';

@injectable
class ItemDetailsCubit extends CubitBase<ItemDetailsState> {
  ItemDetailsCubit(this._repository) : super(const ItemDetailsState());

  final CollectionRepository _repository;

  void setItem(final CollectionItemEntity item) {
    emit(state.copyWith(item: item));
    if (item != CollectionItemEntity.empty) getDetails(item.id);
  }

  Future<void> getDetails(final int id) async {
    emit(state.copyWith(isLoading: true));
    final validateEmailResponse = await _repository.getItemDetails(1);
    if (validateEmailResponse.isSuccess) {
      emit(state.copyWith(item: validateEmailResponse.value!));
    }
    emit(state.copyWith(isLoading: false));
  }
}
