// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:io';

import 'package:glob/glob.dart';

const String licenseHeader = '''
// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
''';

final includedPatterns = [Glob('**.dart')];
final excludedPatterns = [
  Glob('**.g.dart'),
  Glob('**.freezed.dart'),
  Glob('**.tailor.dart'),
  Glob('**.steps.dart'),
  Glob('**/generated/**'),
];

void main(List<String> args) {
  final apply = args.contains('--apply');
  final check = args.contains('--check');

  if (!apply && !check) {
    print('Usage: dart tools/license_manager.dart [--check | --apply]');
    exit(1);
  }

  // Parse .gitignore and add to exclusions
  final gitIgnoreFile = File('.gitignore');
  if (gitIgnoreFile.existsSync()) {
    try {
      final ignored = parseGitIgnore(gitIgnoreFile);
      excludedPatterns.addAll(ignored);
      print('Loaded ${ignored.length} ignore patterns from .gitignore');
    } catch (e) {
      print('Failed to parse .gitignore: $e');
    }
  }

  final rootDir = Directory.current;
  final files = rootDir.listSync(recursive: true, followLinks: false);
  bool hasError = false;
  int count = 0;

  for (final entity in files) {
    if (entity is! File) continue;

    final path = entity.path;

    // Only check Dart files
    if (!includedPatterns.any((pattern) => pattern.matches(path))) continue;

    // Ignore hidden files and directories
    if (path.contains(Platform.pathSeparator + '.')) continue;

    // Ignore generated files and .gitignore exclusions
    if (excludedPatterns.any((pattern) => pattern.matches(path))) {
      continue;
    }

    // Ignore build artifacts
    if (path.contains('/build/') || path.contains('\\build\\')) continue;

    final file = File(entity.path);
    final content = file.readAsStringSync();
    if (!content.contains('GNU General Public License')) {
      if (check) {
        print('Missing license header: $path');
        hasError = true;
      } else if (apply) {
        print('Applying license header to: $path');

        // Handle shebang or library directives if necessary, but usually prepending is fine for Dart
        // unless it's a script with #!/usr/bin/env dart.
        // If there is a shebang, insert after it.
        if (content.startsWith('#!')) {
          final lines = content.split('\n');
          lines.insert(1, '\n' + licenseHeader);
          file.writeAsStringSync(lines.join('\n'));
        } else {
          file.writeAsStringSync(licenseHeader + '\n' + content);
        }
        count++;
      }
    }
  }

  if (check && hasError) {
    print(
      'License check failed. Run "dart tools/license_manager.dart --apply" to fix.',
    );
    exit(1);
  }

  if (apply) {
    print('Applied license header to $count files.');
  } else {
    print('License check passed.');
  }
}

List<Glob> parseGitIgnore(File file) {
  final lines = file.readAsLinesSync();
  final globs = <Glob>[];

  for (var line in lines) {
    line = line.trim();
    if (line.isEmpty || line.startsWith('#')) continue;

    // Normalized gitignore pattern
    var pattern = line;
    bool isDir = false;

    if (pattern.endsWith('/')) {
      isDir = true;
      pattern = pattern.substring(0, pattern.length - 1);
    }

    bool isRooted = pattern.startsWith('/') || pattern.contains('/');
    if (pattern.startsWith('/')) {
      pattern = pattern.substring(1);
    }

    String globPattern;
    if (isRooted) {
      globPattern = pattern;
    } else {
      globPattern = '**/' + pattern;
    }

    if (isDir) {
      globPattern += '/**';
    } else {
      globPattern += '{,/**}';
    }

    try {
      globs.add(Glob(globPattern));
    } catch (e) {
      print('Warning: Could not parse .gitignore pattern "$line": $e');
    }
  }
  return globs;
}
