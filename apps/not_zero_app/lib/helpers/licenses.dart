import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void addAppLicenses() {
  LicenseRegistry.addLicense(() async* {
    try {
      final license =
          await rootBundle.loadString('fonts/SourceCodePro-OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    } catch (_) {
      yield const LicenseEntryWithLineBreaks(
        ['google_fonts'],
        "Can't load license",
      );
    }
  });
}
