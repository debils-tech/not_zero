import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
  generateForDir: ['lib'],
)
void configureDependencies() => $initGetIt(getIt);
