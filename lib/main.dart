import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/custom_scroll_behavior.dart';
import 'package:not_zero/helpers/global_navigation.dart';
import 'package:not_zero/helpers/licenses.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/logger/config.dart';
import 'package:not_zero/routes.dart';
import 'package:not_zero/themes/themes.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/presentation/bloc/theme_bloc.dart';
import 'package:nz_common/nz_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageProvider.initHiveBoxes();

  configureDependencies();
  addAppLicenses();
  configLogger();

  runApp(
    TranslationProvider(
      child: BlocProvider(
        create: (_) => getIt<AppThemeBloc>(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = TranslationProvider.of(context).flutterLocale;

    return BlocBuilder<AppThemeBloc, ThemeState>(
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
    );
  }
}
