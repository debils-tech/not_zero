import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class EnvManager {
  EnvManager(this._envDev, this._envProd, this._useDevStateController);

  final DotEnv _envDev;
  final DotEnv _envProd;
  final StateController<bool> _useDevStateController;

  static final _log = Logger('EnvManager');

  Future<void> loadEnv() async {
    _log.fine('Loading all the environment variables');
    await Future.wait([
      _envDev.load(fileName: '.env.dev'),
      _envProd.load(fileName: '.env.prod'),
    ]);
    _log.finest('Loaded all the environment variables');
  }

  void switchToDev() {
    _log.info('Switching to dev environment');
    _useDevStateController.state = true;
  }

  void switchToProduction() {
    _log.info('Switching to production environment');
    _useDevStateController.state = false;
  }
}
