class PatternValidator {
  PatternValidator._();

  static final uuidPattern =
      RegExp(r'^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$');

  static bool isUuid(String str) => uuidPattern.hasMatch(str);
}
