import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';

import '../global_init.dart';

void main() {
  globalInit();

  test('Form changes', () {
    final cubit = getIt<TaskEditCubit>();
    expect(cubit.state, false);

    expect(cubit.stream, emitsInOrder([true, false]));

    cubit.changeForm(isCorrect: true);
    cubit.changeForm(isCorrect: false);
  });

  // TODO(uSlashVlad): Save and delete tasks.
}
