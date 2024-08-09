import 'package:flutter_test/flutter_test.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

void main() {
  test('Task importance fromIndex', () {
    expect(TaskImportance.fromIndex(0), TaskImportance.notImportant);
    expect(TaskImportance.fromIndex(1), TaskImportance.normal);
    expect(TaskImportance.fromIndex(2), TaskImportance.important);
    expect(TaskImportance.fromIndex(3), TaskImportance.normal);
  });
}
