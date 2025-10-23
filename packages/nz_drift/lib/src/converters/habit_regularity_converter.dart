import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HabitRegularityConverter extends TypeConverter<HabitRegularity, String> {
  const HabitRegularityConverter();

  @override
  HabitRegularity fromSql(String fromDb) {
    return HabitRegularity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(HabitRegularity value) {
    return jsonEncode(value.toJson());
  }

  static String get defaultValue =>
      const HabitRegularityConverter().toSql(HabitRegularity.daily());
}
