import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/units/tasks/presentation/view/tasks_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(scheme: FlexScheme.ebonyClay).copyWith(
        extensions: <ThemeExtension>[
          TaskColors(
            notImportantColor: Colors.blueGrey.shade400,
            normalColor: Colors.amber,
            importantColor: Colors.red,
          ),
        ],
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.ebonyClay).copyWith(
        extensions: <ThemeExtension>[
          TaskColors(
            notImportantColor: Colors.grey[350]!,
            normalColor: Colors.amberAccent,
            importantColor: Colors.redAccent,
          ),
        ],
      ),
      home: const TasksListScreen(),
    );
  }
}
