import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void addAppLicenses() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/SourceCodePro-OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
