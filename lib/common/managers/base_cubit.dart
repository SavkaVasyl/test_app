import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

///This is a base class that can be used to avoid calling emit after an async operation
///You should always wrap your async call with [execute] if it may followed by an emit call
///Use [subscribe] to wrap a [StreamSubscription] whenever you call the [Stream.listen] method
abstract class CubitBase<State> extends Cubit<State> {
  CubitBase(super.initialState);

  final Set<CancelableOperation> _asyncOperations = {};
  final CompositeSubscription _streamSubscriptions = CompositeSubscription();

  Future<T> execute<T>(final Future<T> asyncFunction) {
    final operation = CancelableOperation.fromFuture(asyncFunction);
    _asyncOperations.add(operation);
    return operation.value;
  }

  void subscribe(final StreamSubscription subscription) {
    _streamSubscriptions.add(subscription);
  }

  @override
  void emit(final State state) {
    if (isClosed) return;
    super.emit(state);
  }

  @mustCallSuper
  @override
  Future<void> close() async {
    final operationsToCancelFutures = _asyncOperations
        .where((final operation) => !operation.isCanceled)
        .map((final operation) => operation.cancel())
        .toList();
    await Future.wait([
      ...operationsToCancelFutures,
      _streamSubscriptions.cancel(),
    ]);
    return super.close();
  }
}
