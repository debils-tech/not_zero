import 'package:nz_flutter_core/nz_flutter_core.dart';

void testWithAllTranslations(void Function(AppLocale) testCallback) {
  for (final locale in AppLocale.values) {
    testCallback(locale);
  }
}
