import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class FakeTranslationProvider extends StatelessWidget {
  const FakeTranslationProvider({
    required this.locale,
    required this.child,
    super.key,
  });

  final AppLocale locale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locale.build(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          throw Exception(asyncSnapshot.error);
        }

        if (!asyncSnapshot.hasData) {
          return const CircularProgressIndicator();
        }

        LocaleSettings.instance.loadLocaleSync(locale);
        final translations = LocaleSettings.instance.getTranslations(locale);

        return InheritedLocaleData<AppLocale, Translations>(
          translations: translations,
          child: child,
        );
      },
    );
  }
}
