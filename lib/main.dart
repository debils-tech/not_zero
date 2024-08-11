import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/helpers/custom_scroll_behavior.dart';
import 'package:not_zero/helpers/global_navigation.dart';
import 'package:not_zero/helpers/licenses.dart';
import 'package:not_zero/routes.dart';
import 'package:not_zero/units/settings/di.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/presentation/bloc/theme_bloc.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_logger/nz_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: avoid_redundant_argument_values
  configLogger(production: !kDebugMode);
  addAppLicenses();

  final container = ProviderContainer();

  final settings = container.read(settingsBoxProvider);
  await settings.init();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: TranslationProvider(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = TranslationProvider.of(context).flutterLocale;

    return BlocProvider(
      create: (_) => ref.watch(appThemeBlocProvider),
      child: BlocBuilder<AppThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(),
            shortcuts: {
              if (isPlatformDesktop || kIsWeb)
                const SingleActivator(LogicalKeyboardKey.escape):
                    VoidCallbackIntent(
                  () => GlobalNavigation.navigator?.maybePop(),
                ),
            },

            //-- Themes --
            themeMode: switch (state) {
              ThemeState.light => ThemeMode.light,
              ThemeState.dark => ThemeMode.dark,
              ThemeState.system => ThemeMode.system,
            },
            theme: defaultLightTheme,
            darkTheme: defaultDarkTheme,

            //-- Routing --
            routeInformationProvider: appRouter.routeInformationProvider,
            routeInformationParser: appRouter.routeInformationParser,
            routerDelegate: appRouter.routerDelegate,

            //-- Localization --
            locale: locale,
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
        },
        buildWhen: (prev, next) => prev != next,
      ),
    );
  }
}
