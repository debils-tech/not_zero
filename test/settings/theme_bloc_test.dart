import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/presentation/bloc/theme_bloc.dart';

import '../async.dart';
import '../global_init.dart';

void main() {
  globalInit();

  test('Initial state', () async {
    final bloc = getIt<AppThemeBloc>();

    expect(bloc.state, ThemeState.system);
  });

  test('Save state', () async {
    final bloc = getIt<AppThemeBloc>();

    for (final value in ThemeState.values) {
      await testBlocSingle(bloc, value, value);
    }
  });
}
