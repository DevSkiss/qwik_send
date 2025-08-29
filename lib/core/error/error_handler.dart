import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/shared/constants/logger.dart';

/// Handles most of the error and returns a [Failure] object
Failure commonErrorHandler(Object error) {
  try {
    logger.e(error.toString());
    throw error;
  } on Failure catch (e) {
    return e;
  } catch (e) {
    logger.e(e.runtimeType);
    return Failure(message: 'Unexpected error: \n$e', exception: e);
  }
}
