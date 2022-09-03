import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';

@injectable
class TasksListCubit extends Cubit<TasksListState> {
  TasksListCubit() : super(const TasksListState.loading());

  Future<void> loadTasks() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(
      TasksListState.loaded([
        Task(
          id: '1',
          title: 'Task 1',
          description: 'Some not important task',
          importance: TaskImportance.notImportant,
        ),
        Task(
          id: '2',
          title: 'Task 56',
          description: 'Some highly important task',
          importance: TaskImportance.important,
        ),
      ]),
    );
  }
}
