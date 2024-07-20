import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/configs/models/config_model.dart';

class ConfigsStateHolder extends Notifier<Map<String, ConfigModel>> {
  @override
  Map<String, ConfigModel> build() {
    return const {};
  }

  void addConfig(ConfigModel config) {
    state = {
      ...state,
      config.key: config,
    };
  }

  void reset() {
    state = const {};
  }
}
