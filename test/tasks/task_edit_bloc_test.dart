import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';

import '../async.dart';
import '../global_init.dart';

void main() {
  globalInit();

  test('Form changes', () {
    final cubit = getIt<TaskEditCubit>();

    expect(cubit.state, false);

    testCubitSingle(
      cubit,
      () => cubit.changeForm(isCorrect: true),
      true,
    );

    testCubitSingle(
      cubit,
      () => cubit.changeForm(isCorrect: false),
      false,
    );
  });

  // TODO(uSlashVlad): Save and delete tasks.
}
