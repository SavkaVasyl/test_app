import 'package:logger/logger.dart';
import 'package:test_app/common/di/di.dart';

void printMessage(final String message) => serviceLocator<Logger>().i(message);

void printError(final String message, [final dynamic e, final StackTrace? st]) => serviceLocator<Logger>().e(message, error: e, stackTrace: st);
