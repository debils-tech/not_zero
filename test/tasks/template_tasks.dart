import 'package:not_zero/units/tasks/domain/models/task.dart';

final templateTasks1 = <Task>[
  Task(
    id: 'b51835df-b293-4ab8-84f9-7170db785465',
    title: 'Hello World',
    description: '1',
    importance: TaskImportance.normal,
    createdAt: DateTime(2022),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1664392368),
  ),
  Task(
    id: 'b2f659ad-7e31-4abd-a399-3d276800deaa',
    title: 'Foo',
    description: '2',
    importance: TaskImportance.notImportant,
    createdAt: DateTime(2022, 2),
  ),
  Task(
    id: 'cbdaad36-6080-4aa6-8648-432037575a78',
    title: 'Bar',
    importance: TaskImportance.important,
    createdAt: DateTime(2022, 3),
  ),
];

final templateTasks2 = <Task>[
  Task(
    id: '3740d335-9357-4494-a457-911afe12bd12',
    title: 'Task 1',
    description: '1',
    importance: TaskImportance.normal,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1000000),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1664390368),
  ),
  Task(
    id: '06281633-36a6-42c6-9271-a664554d0e60',
    title: 'Task 2',
    description: '2',
    importance: TaskImportance.notImportant,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1200000),
  ),
  Task(
    id: '3ec47d07-f6ee-4c09-acd0-57ec2753b142',
    title: 'Task 3',
    importance: TaskImportance.important,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1300000),
  ),
];
