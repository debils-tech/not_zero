// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
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

import 'package:flutter/material.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';

class FakeTranslationProvider extends StatelessWidget {
  const FakeTranslationProvider({
    required this.locale,
    required this.child,
    super.key,
  });

  final AppLocale locale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locale.build(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          throw Exception(asyncSnapshot.error);
        }

        if (!asyncSnapshot.hasData) {
          return const CircularProgressIndicator();
        }

        LocaleSettings.instance.loadLocaleSync(locale);
        final translations = LocaleSettings.instance.getTranslations(locale);

        return InheritedLocaleData<AppLocale, Translations>(
          translations: translations,
          child: child,
        );
      },
    );
  }
}
