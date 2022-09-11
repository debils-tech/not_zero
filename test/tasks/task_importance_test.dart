import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

void main() {
  test('Task importance fromIndex', () {
    expect(TaskImportance.fromIndex(0), TaskImportance.notImportant);
    expect(TaskImportance.fromIndex(1), TaskImportance.normal);
    expect(TaskImportance.fromIndex(2), TaskImportance.important);
    expect(TaskImportance.fromIndex(3), TaskImportance.normal);
  });

  test('Task importance toIndex', () {
    expect(TaskImportance.notImportant.toIndex(), 0);
    expect(TaskImportance.normal.toIndex(), 1);
    expect(TaskImportance.important.toIndex(), 2);
  });
}
