import 'package:drift/drift.dart';
import 'package:nz_drift/src/db.steps.dart';

part 'from_1_to_2.dart';
part 'from_2_to_3.dart';
part 'from_3_to_4.dart';
part 'from_4_to_5.dart';
part 'from_5_to_6.dart';

Future<int> Function(int, GeneratedDatabase) get notZeroMigrationSteps =>
    migrationSteps(
      from1To2: _from1To2,
      from2To3: _from2To3,
      from3To4: _from3To4,
      from4To5: _from4To5,
      from5To6: _from5To6,
    );
