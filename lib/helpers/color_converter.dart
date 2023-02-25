import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ColorJsonConverter extends JsonConverter<Color, String> {
  const ColorJsonConverter();

  @override
  Color fromJson(String json) {
    return Color(int.parse(json));
  }

  @override
  String toJson(Color object) {
    return '0x${object.value.toRadixString(16)}';
  }
}

class ColorDatabaseConverter extends TypeConverter<Color, String> {
  const ColorDatabaseConverter();

  @override
  Color fromSql(String fromDb) {
    return const ColorJsonConverter().fromJson(fromDb);
  }

  @override
  String toSql(Color value) {
    return const ColorJsonConverter().toJson(value);
  }
}
