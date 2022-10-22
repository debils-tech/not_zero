import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/task_edit_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_bloc.dart';

import '../async.dart';
import '../global_init.dart';

void main() {
  globalInit();

  test('Form changes', () {
    final bloc = getIt<TaskEditBloc>();

    expect(bloc.state, false);

    testBlocSingle(
      bloc,
      const TaskEditEvent.changeForm(correct: true),
      true,
    );

    testBlocSingle(
      bloc,
      const TaskEditEvent.changeForm(correct: false),
      false,
    );
  });

  // TODO(uSlashVlad): Save and delete tasks.
}
