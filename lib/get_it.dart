import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/get_it.config.dart';
import 'package:not_zero_storage/not_zero_database.dart';

/// Simple shortcut for [GetIt.instance]
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
  generateForDir: ['lib'],
)

/// Configures both manual and generated dependencies
void configureDependencies() {
  _manualDeps();
  $initGetIt(getIt);
}

void _manualDeps() {
  getIt.registerSingleton<DatabaseProvider>(DatabaseProvider.sembast());
}
