import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/data/exception.dart';
import 'package:test_app/common/utils/result_utils.dart';
import 'package:test_app/features/main/data/datasource/collection_remote_datasource.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';

abstract class CollectionRepository {
  Future<Result<List<CollectionItemEntity>>> getItems();

  Future<Result<CollectionItemEntity>> getItemDetails(final int id);
}

@Injectable(as: CollectionRepository)
class CollectionRepositoryImpl implements CollectionRepository {
  CollectionRepositoryImpl(this._collectionRemoteDatasource);

  final CollectionRemoteDatasource _collectionRemoteDatasource;

  @override
  Future<Result<List<CollectionItemEntity>>> getItems() async {
    try {
      final response = await _collectionRemoteDatasource.getCollectionItem();
      return Result.success(response);
    } on DioException catch (e, stack) {
      return Result.failure(NetworkFailure.httpError(error: e, stack: stack));
    } catch (e, stack) {
      return Result.failure(NetworkFailure.unknownError(error: e, stack: stack));
    }
  }

  @override
  Future<Result<CollectionItemEntity>> getItemDetails(final int id) async {
    try {
      final response = await _collectionRemoteDatasource.getItemDetails(id);
      return Result.success(response);
    } on DioException catch (e, stack) {
      return Result.failure(NetworkFailure.httpError(error: e, stack: stack));
    } catch (e, stack) {
      return Result.failure(NetworkFailure.unknownError(error: e, stack: stack));
    }
  }
}
