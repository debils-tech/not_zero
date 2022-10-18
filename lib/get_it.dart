import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/get_it.config.dart';

/// Simple shortcut for [GetIt.instance].
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
  generateForDir: ['lib'],
)

/// Configures both manual and generated dependencies.
void configureDependencies() {
  $initGetIt(getIt);
}
