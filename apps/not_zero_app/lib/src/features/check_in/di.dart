import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/check_in/notifiers/check_in_state_notifier.dart';
import 'package:not_zero_app/src/features/check_in/repositories/check_in_repository.dart';
import 'package:not_zero_app/src/features/check_in/services/check_in_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';

final checkInLocalServiceProvider = Provider<CheckInLocalService>((ref) {
  return CheckInLocalService(
    ref.watch(databaseProvider),
  );
});

final checkInRepositoryProvider = Provider<CheckInRepository>((ref) {
  return CheckInRepository(
    ref.watch(checkInLocalServiceProvider),
  );
});

final checkInStateNotifierProvider = AsyncNotifierProvider.autoDispose(
  CheckInStateNotifier.new,
);
