import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/src/converters/date_converter.dart';

@UseRowClass(AppDailyCheckIn, generateInsertable: true)
class CheckInTable extends Table {
  TextColumn get id => text()();
  TextColumn get checkInDate => text().unique().map(const DateConverter())();
  IntColumn get streakCount => integer().withDefault(const Constant(1))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
