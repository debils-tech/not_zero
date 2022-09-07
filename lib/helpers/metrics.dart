import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class MetricsHelper {
  static Future<void> captureException(
    dynamic exception, {
    StackTrace? stackTrace,
    String? hint,
  }) async {
    // TODO(uSlashVlad): Replace with logger in the future.
    debugPrint('$exception\n$stackTrace');

    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      hint: hint,
    );
  }

  static Future<T> trackPerformance<T>({
    required FutureOr<T> Function() process,
    required String processName,
    required String operationName,
  }) async {
    final transaction = Sentry.startTransaction(
      processName,
      operationName,
    );

    try {
      final result = await process();
      await transaction.finish(status: const SpanStatus.ok());

      return result;
    } catch (e) {
      switch (e.runtimeType) {
        case UnimplementedError:
          await transaction.finish(status: const SpanStatus.unimplemented());
          break;
        default:
          await transaction.finish(status: const SpanStatus.unknownError());
      }

      rethrow;
    }
  }

  static Future<T> trackAndCapture<T>({
    required FutureOr<T> Function() process,
    required String processName,
    required CustomOperations operation,
  }) async {
    try {
      return trackPerformance<T>(
        process: process,
        processName: processName,
        operationName: operation.name,
      );
    } catch (e, s) {
      await captureException(e, stackTrace: s, hint: processName);
      rethrow;
    }
  }
}

enum CustomOperations {
  database;
}
