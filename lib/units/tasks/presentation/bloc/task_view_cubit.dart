import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

@injectable
class TaskViewCubit extends Cubit<Task?> {
  TaskViewCubit(this._repository) : super(null);

  final TasksRepository _repository;

  String? _taskId;
  StreamSubscription<Task>? _taskSubscription;

  void init(String taskId) {
    _taskId = taskId;
    _taskSubscription = _repository.subscribeOnTaskById(taskId).listen(emit);
  }

  @override
  Future<void> close() {
    _taskSubscription?.cancel();
    if (_taskId != null) {
      _repository.disposeTaskSubscription(_taskId!);
    }
    return super.close();
  }
}
