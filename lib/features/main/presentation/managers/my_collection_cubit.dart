import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/managers/base_cubit.dart';
import 'package:test_app/features/main/data/repository/collection_repository.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';

part 'my_collection_state.dart';

@injectable
class MyCollectionCubit extends CubitBase<MyCollectionState> {
  MyCollectionCubit(this._repository) : super(const MyCollectionState()) {
    getContent();
  }

  final CollectionRepository _repository;

  Future<void> getContent() async {
    emit(state.copyWith(isLoading: true));
    final validateEmailResponse = await _repository.getItems();
    if (validateEmailResponse.isSuccess) {
      emit(state.copyWith(items: validateEmailResponse.value!));
    }
    emit(state.copyWith(isLoading: false));
  }
}
