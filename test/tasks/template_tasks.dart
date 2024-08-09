import 'package:nz_tasks_models/nz_tasks_models.dart';

final templateTasks1 = <Task>[
  Task(
    id: 'b51835df-b293-4ab8-84f9-7170db785465',
    title: 'Hello World',
    description: '1',
    importance: TaskImportance.normal,
    createdAt: DateTime(2022),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1664392368000),
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
    createdAt: DateTime.fromMillisecondsSinceEpoch(1427819182000),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1664390368000),
  ),
  Task(
    id: '06281633-36a6-42c6-9271-a664554d0e60',
    title: 'Task 2',
    description: '2',
    importance: TaskImportance.notImportant,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1741189309000),
  ),
  Task(
    id: '3ec47d07-f6ee-4c09-acd0-57ec2753b142',
    title: 'Task 3',
    importance: TaskImportance.important,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1343225833000),
  ),
];

/// This set of test tasks contains more of completed tasks.
final templateTasks3 = <Task>[
  Task(
    id: 'a8e0dddc-51f1-4deb-86e9-f31f45cbbd8c',
    title: 'Task 1',
    description: '1',
    importance: TaskImportance.normal,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1030729530000),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1664370368000),
  ),
  Task(
    id: 'f670866f-3a31-4c3d-81e8-3b0fa88f4494',
    title: 'Task 2',
    description: '2',
    importance: TaskImportance.notImportant,
    createdAt: DateTime.fromMillisecondsSinceEpoch(997278857000),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1664392368000),
  ),
  Task(
    id: '5a81f313-31a4-482b-93fe-f40a52f98de9',
    title: 'Task 3',
    importance: TaskImportance.important,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1588989168000),
  ),
  Task(
    id: '4b0a43af-bebd-44be-a6cd-78ad1393ef8a',
    title: 'Task 4',
    description: '1',
    importance: TaskImportance.important,
    createdAt: DateTime(2022),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1662392368000),
  ),
  Task(
    id: 'd6614c6f-0a37-4fc0-8559-af374ad53a54',
    title: 'Task 5',
    description: '2',
    importance: TaskImportance.notImportant,
    createdAt: DateTime(2022, 2),
  ),
  Task(
    id: 'ad4c0ed1-ca5b-49ba-950f-31ba346edd49',
    title: 'Task 6',
    importance: TaskImportance.important,
    createdAt: DateTime(2022, 3),
  ),
  Task(
    id: 'afe3252b-1eda-44c7-a156-0a34fe908e30',
    title: 'Task 7',
    importance: TaskImportance.normal,
    createdAt: DateTime(2022),
    completedAt: DateTime.fromMillisecondsSinceEpoch(1662392318000),
  ),
];

/// Set of tasks is needed generaly for task filtering implemented for stats.
///
/// Contains this tasks:
/// - **not important**, **completed** at `31.12.2022`
/// - **not important**, **not completed** at `31.12.2022`
/// - **normal**, **completed** at `01.01.2023`
/// - **important**, **completed** at `03.01.2023`
/// - **not important**, **completed** at `03.01.2023`
/// - **important**, **not completed** at `03.01.2023`
/// - **normal**, **completed** at `05.01.2023`
final templateTasks4 = <Task>[
  Task(
    id: '237ebdb1-d1e5-477b-9ace-643a6cec9e77',
    title: '+1',
    createdAt: DateTime(2022, 12, 31),
    completedAt: DateTime(2022, 12, 31),
    importance: TaskImportance.notImportant,
  ),
  Task(
    id: '800a7924-db1b-43c8-8bda-84f319a04e26',
    title: '-1',
    createdAt: DateTime(2022, 12, 31),
    importance: TaskImportance.notImportant,
  ),
  Task(
    id: '816c9083-ec6c-41cf-93cd-8545f028fc38',
    title: '+2',
    createdAt: DateTime(2023),
    completedAt: DateTime(2023),
    importance: TaskImportance.normal,
  ),
  Task(
    id: '5b7b6d3a-624f-4627-974e-fd8f84e09248',
    title: '+3',
    createdAt: DateTime(2023, 1, 3),
    completedAt: DateTime(2023, 1, 3),
    importance: TaskImportance.important,
  ),
  Task(
    id: '2c43d299-cb3b-4739-8668-1f411dab6d52',
    title: '+4',
    createdAt: DateTime(2023, 1, 3, 12),
    completedAt: DateTime(2023, 1, 3, 12),
    importance: TaskImportance.notImportant,
  ),
  Task(
    id: '78d3b058-626e-40ad-bfb5-38a25d6bf0cd',
    title: '-2',
    createdAt: DateTime(2023, 1, 3),
    importance: TaskImportance.important,
  ),
  Task(
    id: '7d188716-c0e6-46df-9344-95619d83932a',
    title: '+5',
    createdAt: DateTime(2023, 1, 5),
    completedAt: DateTime(2023, 1, 5),
    importance: TaskImportance.normal,
  ),
];
