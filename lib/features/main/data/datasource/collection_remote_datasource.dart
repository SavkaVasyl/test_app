import 'package:injectable/injectable.dart';
import 'package:test_app/features/main/data/datasource/fake_collection_api_service.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';

abstract class CollectionRemoteDatasource {
  Future<List<CollectionItemEntity>> getCollectionItem();

  Future<CollectionItemEntity> getItemDetails(final int id);
}

@Injectable(as: CollectionRemoteDatasource)
class UserApiDatasource extends CollectionRemoteDatasource {
  UserApiDatasource(this._fakeCollectionApiService);

  final FakeCollectionApiService _fakeCollectionApiService;

  @override
  Future<List<CollectionItemEntity>> getCollectionItem() async {
    final response = await _fakeCollectionApiService.getItems();
    return response.data;
  }

  @override
  Future<CollectionItemEntity> getItemDetails(final int id) async {
    final response = await _fakeCollectionApiService.getItemDetails();
    return response.data;
  }
}
