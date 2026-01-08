// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero_app/src/features/notifications/helpers/init_notification_helper.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/features/themes/themes.dart';
import 'package:not_zero_app/src/features/themes/utils/dynamic_theme_application_ext.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/global_navigation.dart';
import 'package:not_zero_app/src/helpers/licenses.dart';
import 'package:not_zero_app/src/routes.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_logger/nz_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // kDebugMode can be true, but analyzer doesn't know that
  // ignore: avoid_redundant_argument_values
  configLogger(production: !kDebugMode);
  addAppLicenses();

  final container = ProviderContainer();

  final settings = container.read(settingsBoxProvider);
  await settings.init();

  await InitNotificationHelper.initAppNotifications();

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

    final themeSettings = ref.watch(themeSettingsNotifierProvider);
    final appRouter = ref.watch(appRouterProvider);

    return _OptionalDynamicColorsBuilder(
      useDynamicColors: themeSettings.useDynamicColors,
      builder: (lightColorScheme, darkColorScheme) {
        final lightTheme = defaultLightTheme.applyDynamicColors(
          lightColorScheme,
          harmonize: themeSettings.harmonizeColors,
        );
        final darkTheme = defaultDarkTheme.applyDynamicColors(
          darkColorScheme,
          harmonize: themeSettings.harmonizeColors,
        );

        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          shortcuts: {
            if (isPlatformDesktop || kIsWeb)
              const SingleActivator(
                LogicalKeyboardKey.escape,
              ): VoidCallbackIntent(
                () => GlobalNavigation.navigator?.maybePop(),
              ),
          },

          //-- Themes --
          themeMode: switch (themeSettings.themeState) {
            .light => ThemeMode.light,
            .dark => ThemeMode.dark,
            .system => ThemeMode.system,
          },
          theme: lightTheme,
          darkTheme: darkTheme,

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
    );
  }
}

class _OptionalDynamicColorsBuilder extends ConsumerWidget {
  const _OptionalDynamicColorsBuilder({
    required this.useDynamicColors,
    required this.builder,
  });

  final bool useDynamicColors;
  final Widget Function(
    ColorScheme? lightColorScheme,
    ColorScheme? darkColorScheme,
  )
  builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!useDynamicColors) {
      return builder(null, null);
    }

    return DynamicColorBuilder(builder: builder);
  }
}
