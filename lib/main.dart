import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/constants/themes.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/initialization.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/routes.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/presentation/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await InitializationHelper.initDatabaseRelated();

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
