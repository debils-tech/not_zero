import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_drift/src/converters/habit_regularity_converter.dart';

@UseRowClass(Habit, generateInsertable: true)
class HabitsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get modifiedAt => dateTime().nullable()();
  IntColumn get importance => intEnum<TaskImportance>()();
  TextColumn get regularity => text()
      .map(const HabitRegularityConverter())
      .withDefault(Constant(HabitRegularityConverter.defaultValue))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@UseRowClass(HabitCompletion, generateInsertable: true)
class HabitCompletionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get habitId => text().references(HabitsTable, #id)();
  IntColumn get type => intEnum<HabitCompletionType>()();
  TextColumn get completedDate => text().map(const DateConverter())();

  @override
  Set<Column<Object>>? get primaryKey => {id};

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
    {habitId, completedDate},
  ];
}
