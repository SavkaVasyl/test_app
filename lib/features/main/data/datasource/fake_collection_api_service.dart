import 'package:injectable/injectable.dart';
import 'package:test_app/features/main/data/models/collection_item_model.dart';
import 'package:test_app/features/main/data/responses/api_response.dart';

@lazySingleton
class FakeCollectionApiService {
  Future<ApiResponse<List<CollectionItemModel>>> getItems() async {
    await Future.delayed(const Duration(seconds: 1));
    final json = {
      'success': true,
      'data': [
        {'id': 1, 'title': 'Springbank1', 'image': 'ic_temp_bottle.png'},
        {'id': 2, 'title': 'Springbank2', 'image': 'ic_temp_bottle.png'},
        {'id': 3, 'title': 'Springbank3', 'image': 'ic_temp_bottle.png'},
        {'id': 4, 'title': 'Springbank4', 'image': 'ic_temp_bottle.png'},
        {'id': 5, 'title': 'Springbank5', 'image': 'ic_temp_bottle.png'},
        {'id': 6, 'title': 'Springbank6', 'image': 'ic_temp_bottle.png'},
        {'id': 7, 'title': 'Springbank7', 'image': 'ic_temp_bottle.png'},
        {'id': 8, 'title': 'Springbank8', 'image': 'ic_temp_bottle.png'},
        {'id': 9, 'title': 'Springbank9', 'image': 'ic_temp_bottle.png'},
      ],
    };
    return ApiResponse(
      success: json['success']! as bool,
      data: (json['data']! as List).map((final element) => CollectionItemModel.fromJson(element)).toList(),
    );
  }

  Future<ApiResponse<CollectionItemModel>> getItemDetails() async {
    await Future.delayed(const Duration(seconds: 1));
    final json = {
      'success': true,
      'data': {
        'id': 1,
        'title': 'Springbank1',
        'image': 'ic_temp_bottle.png',
        'details': {
          'distillery': 'Text',
          'region': 'Text',
          'type': 'Text',
          'filled': 'Text',
          'bottled': 'Text',
        },
      },
    };
    return ApiResponse(
      success: json['success']! as bool,
      data: CollectionItemModel.fromJson(json['data']! as Map<String, dynamic>),
    );
  }
}
