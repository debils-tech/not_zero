import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/env.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/routes.dart';
import 'package:not_zero_storage/not_zero_database.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = Env.sentryDSN
          ..sampleRate = 1.0
          ..tracesSampleRate = 1.0
          ..reportPackages = true;
      },
    );

    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();

    await getIt<DatabaseProvider>().init();

    runApp(TranslationProvider(child: const MyApp()));
  }, (e, s) {
    Sentry.captureException(e, stackTrace: s);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightThemeBase = FlexThemeData.light(
      scheme: FlexScheme.material,
      extensions: <ThemeExtension>[
        TaskColors(
          notImportantColor: Colors.blueGrey.shade400,
          normalColor: Colors.amber,
          importantColor: Colors.red,
        ),
      ],
    );
    final darkThemeBase = FlexThemeData.dark(
      scheme: FlexScheme.material,
      extensions: <ThemeExtension>[
        TaskColors(
          notImportantColor: Colors.grey[350]!,
          normalColor: Colors.amberAccent,
          importantColor: Colors.redAccent,
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      //-- Themes --
      themeMode: ThemeMode.dark,
      theme: lightThemeBase.copyWith(
        useMaterial3: true,
        textTheme: lightThemeBase.textTheme.copyWith(
          subtitle2: TextStyle(color: Colors.grey.shade500),
        ),
        checkboxTheme: lightThemeBase.checkboxTheme.copyWith(
          fillColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? lightThemeBase.primaryColorLight
                : null,
          ),
        ),
      ),
      darkTheme: darkThemeBase.copyWith(
        useMaterial3: true,
        textTheme: darkThemeBase.textTheme.copyWith(
          subtitle2: TextStyle(color: Colors.grey.shade700),
        ),
        checkboxTheme: darkThemeBase.checkboxTheme.copyWith(
          fillColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? darkThemeBase.primaryColor
                : null,
          ),
        ),
      ),

      //-- Routing --
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,

      //-- Localization --
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
