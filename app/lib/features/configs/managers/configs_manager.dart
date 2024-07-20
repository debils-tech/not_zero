import 'package:logging/logging.dart';
import 'package:not_zero/features/configs/models/config_model.dart';
import 'package:not_zero/features/configs/state_holders/configs_state_holder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConfigsManager {
  const ConfigsManager(this._supabase, this._configsStateHolder);

  final SupabaseClient _supabase;
  final ConfigsStateHolder _configsStateHolder;

  static final _log = Logger('ConfigsManager');

  Future<void> init() async {
    try {
      _log.finer('Starting loading configs');

      final enabledConfigs = await _supabase
          .from('configs')
          .select('id, enabled, data, key')
          .eq('enabled', true);

      _log.finest('Loaded: ${enabledConfigs.length} configs');

      for (final row in enabledConfigs) {
        final config = ConfigModel.fromJson(row);

        _configsStateHolder.addConfig(config);

        _log.finest('Added config: "${config.key}" = ${config.data}');
      }

      _log.finer('Configs are loaded');
    } catch (e, s) {
      _log.severe('Error while loading configs', e, s);
    }
  }
}
