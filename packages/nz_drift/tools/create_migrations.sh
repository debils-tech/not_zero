set -xeuo pipefail

SCHEMAS_DIR=drift_schemas/

dart run build_runner build -d

dart run drift_dev schema dump lib/src/db.dart $SCHEMAS_DIR

dart run drift_dev schema steps $SCHEMAS_DIR lib/src/migrations/schema_versions.dart
