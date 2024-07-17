import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/supabase/managers/supabase_manager.dart';
import 'package:not_zero/features/supabase/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabaseManager = ref.read(supabaseManagerProvider);

    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _login(supabaseManager),
          builder: (context, snapshot) {
            final success = snapshot.data;
            final text = success != null
                ? success
                    ? 'Hello World!'
                    : 'Failed'
                : 'Loading...';

            return Center(
              child: Text(text),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _login(SupabaseManager manager) async {
    await manager.init();

    return manager.login('u.slash.vlad@gmail.com', '123456');
  }
}
