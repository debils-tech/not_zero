import 'package:drift/drift.dart';

class DateConverter extends TypeConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromSql(String fromDb) {
    final parts = fromDb.split('-');
    assert(parts.length == 3, 'Should be 3 parts: year, month, day');

    final year = int.tryParse(parts.elementAtOrNull(0) ?? '');
    final month = int.tryParse(parts.elementAtOrNull(1) ?? '');
    final day = int.tryParse(parts.elementAtOrNull(2) ?? '');

    if (year == null || month == null || day == null) {
      throw FormatException('Invalid date format', fromDb);
    }

    assert(year > 0, 'Year should be greater than 1');
    assert(month > 0 && month <= 12, 'Month should be between 1 and 12');
    assert(day > 0 && day <= 31, 'Day should be between 1 and 31');

    return DateTime(year, month, day);
  }

  @override
  String toSql(DateTime value) =>
      '${value.year}-${_padLeft(value.month)}-${_padLeft(value.day)}';

  String _padLeft(int number) {
    return number.toString().padLeft(2, '0');
  }
}
