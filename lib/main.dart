import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/routes.dart';
import 'package:not_zero_storage/not_zero_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await getIt<DatabaseProvider>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: FlexThemeData.light(scheme: FlexScheme.material).copyWith(
        useMaterial3: true,
        extensions: <ThemeExtension>[
          TaskColors(
            notImportantColor: Colors.blueGrey.shade400,
            normalColor: Colors.amber,
            importantColor: Colors.red,
          ),
        ],
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.material).copyWith(
        useMaterial3: true,
        extensions: <ThemeExtension>[
          TaskColors(
            notImportantColor: Colors.grey[350]!,
            normalColor: Colors.amberAccent,
            importantColor: Colors.redAccent,
          ),
        ],
      ),
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
