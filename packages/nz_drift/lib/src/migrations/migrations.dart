import 'package:drift/drift.dart';
import 'schema_versions.dart';

export 'schema_versions.dart';

part 'from_1_to_2.dart';

part 'from_2_to_3.dart';

part 'from_3_to_4.dart';

Future<int> Function(int, GeneratedDatabase) get notZeroMigrationSteps =>
    migrationSteps(
      from1To2: _from1To2,
      from2To3: _from2To3,
      from3To4: _from3To4,
    );
