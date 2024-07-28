import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/features/configs/managers/configs_manager.dart';
import 'package:not_zero/features/configs/models/common_configs/feature_toggles.dart';
import 'package:not_zero/features/configs/models/config_model.dart';
import 'package:not_zero/features/configs/state_holders/configs_state_holder.dart';
import 'package:not_zero/features/supabase/providers.dart';

final configsManagerProvider = Provider<ConfigsManager>((ref) {
  return ConfigsManager(
    ref.watch(supabaseClientProvider),
    ref.watch(configsStateHolderProvider.notifier),
  );
});

final configsStateHolderProvider =
    NotifierProvider<ConfigsStateHolder, Map<String, ConfigModel>>(() {
  return ConfigsStateHolder();
});

// Common configs below

final featureTogglesConfigProvider = Provider<FeatureTogglesConfigModel>((ref) {
  return _buildConfig(
    ref,
    key: 'feature_toggles',
    builder: FeatureTogglesConfigModel.fromJson,
  );
});

T _buildConfig<T>(
  ProviderRef<dynamic> ref, {
  required String key,
  required T Function(Map<String, dynamic> data) builder,
}) {
  final configsState = ref.watch(configsStateHolderProvider);
  final data =
      configsState[key]?.data as Map<String, dynamic>? ?? <String, dynamic>{};

  Logger('Config[$key]').info(data);

  return builder(data);
}
