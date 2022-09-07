import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
    @EnviedField(varName: 'SENTRY_DSN')
    static const sentryDSN = _Env.sentryDSN;
}
