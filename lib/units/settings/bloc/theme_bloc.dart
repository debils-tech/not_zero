import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/units/settings/models/theme_state.dart';
import 'package:not_zero/units/settings/repositories/settings_repository.dart';

/// This BLoC just throws changes of theme up to root MaterialApp.
class AppThemeBloc extends Bloc<ThemeState, ThemeState> {
  AppThemeBloc(this._repository) : super(_repository.loadThemeState()) {
    on<ThemeState>((event, emit) {
      emit(event);
      _repository.saveThemeState(event);
    });
  }

  final SettingsRepository _repository;
}
