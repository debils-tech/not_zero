import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/constants/themes.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/global_navigation.dart';
import 'package:not_zero/helpers/licenses.dart';
import 'package:not_zero/helpers/platform_extenstions.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/routes.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/presentation/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageProvider.initHiveBoxes();

  configureDependencies();
  addAppLicenses();

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

  static const _stateToModMap = {
    ThemeState.light: ThemeMode.light,
    ThemeState.dark: ThemeMode.dark,
    ThemeState.system: ThemeMode.system,
  };

  @override
  Widget build(BuildContext context) {
    final locale = TranslationProvider.of(context).flutterLocale;

    return BlocBuilder<AppThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          shortcuts: {
            if (isPlatformDesktop || kIsWeb)
              const SingleActivator(LogicalKeyboardKey.escape):
                  VoidCallbackIntent(
                () => GlobalNavigation.navigator?.maybePop(),
              ),
          },

          //-- Themes --
          themeMode: _stateToModMap[state],
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
