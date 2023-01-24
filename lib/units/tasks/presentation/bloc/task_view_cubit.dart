import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';

@injectable
class TaskViewCubit extends Cubit<Task?> {
  TaskViewCubit(this._repository) : super(null);

  final TasksRepository _repository;

  String? taskId;
  StreamSubscription<Task>? _taskSubscription;

  void init(String taskId) {
    this.taskId = taskId;
    _taskSubscription = _repository.subscribeOnTaskById(taskId).listen(emit);
  }

  @override
  Future<void> close() {
    _taskSubscription?.cancel();
    if (taskId != null) {
      _repository.disposeTaskSubscription(taskId!);
    }
    return super.close();
  }
}
