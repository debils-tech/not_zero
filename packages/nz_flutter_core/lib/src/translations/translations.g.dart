/// Generated file. Do not edit.
///
/// Original: assets/lang
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 72

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
  late final _TranslationsSettingsEn settings =
      _TranslationsSettingsEn._(_root);
  late final _TranslationsStatsEn stats = _TranslationsStatsEn._(_root);
  late final _TranslationsTagsEn tags = _TranslationsTagsEn._(_root);
  late final _TranslationsTasksEn tasks = _TranslationsTasksEn._(_root);
}

// Path: common
class _TranslationsCommonEn {
  _TranslationsCommonEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsCommonDialogEn dialog =
      _TranslationsCommonDialogEn._(_root);
  late final _TranslationsCommonTimeSubtitleEn timeSubtitle =
      _TranslationsCommonTimeSubtitleEn._(_root);
  late final _TranslationsCommonCopyEn copy =
      _TranslationsCommonCopyEn._(_root);
  late final _TranslationsCommonTimeOptionsEn timeOptions =
      _TranslationsCommonTimeOptionsEn._(_root);
}

// Path: settings
class _TranslationsSettingsEn {
  _TranslationsSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsSettingsListEn list =
      _TranslationsSettingsListEn._(_root);
  late final _TranslationsSettingsThemeEn theme =
      _TranslationsSettingsThemeEn._(_root);
  late final _TranslationsSettingsStorageEn storage =
      _TranslationsSettingsStorageEn._(_root);
  late final _TranslationsSettingsAboutEn about =
      _TranslationsSettingsAboutEn._(_root);
}

// Path: stats
class _TranslationsStatsEn {
  _TranslationsStatsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsStatsQuickViewEn quickView =
      _TranslationsStatsQuickViewEn._(_root);
}

// Path: tags
class _TranslationsTagsEn {
  _TranslationsTagsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsTagsCreationEn creation =
      _TranslationsTagsCreationEn._(_root);
}

// Path: tasks
class _TranslationsTasksEn {
  _TranslationsTasksEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsTasksListEn list = _TranslationsTasksListEn._(_root);
  late final _TranslationsTasksViewEn view = _TranslationsTasksViewEn._(_root);
  late final _TranslationsTasksEditEn edit = _TranslationsTasksEditEn._(_root);
}

// Path: common.dialog
class _TranslationsCommonDialogEn {
  _TranslationsCommonDialogEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get confirmTitle => 'Confirm?';
  String get cancelButton => 'Cancel';
  String get okButton => 'Yes';
  String get deleteTitle => 'Confirm deletion';
  String get deleteButton => 'Delete';
  String get webSaveTitle => 'Save file';
  String get exitTitle => 'Confirm exit';
  String get exitContent =>
      'Are you sure you want exit this page? All changes will be lost!';
}

// Path: common.timeSubtitle
class _TranslationsCommonTimeSubtitleEn {
  _TranslationsCommonTimeSubtitleEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String createdAt({required Object time}) => 'created at ${time}';
  String modifiedAt({required Object time}) => 'modified at ${time}';
  String completedAt({required Object time}) => 'completed at ${time}';
}

// Path: common.copy
class _TranslationsCommonCopyEn {
  _TranslationsCommonCopyEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get defaultText => 'Copy content';
  String get completedText => 'Copied!';
}

// Path: common.timeOptions
class _TranslationsCommonTimeOptionsEn {
  _TranslationsCommonTimeOptionsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get today => 'Today';
  String get yesterday => 'Yesterday';
  String get tomorrow => 'Tomorrow';
}

// Path: settings.list
class _TranslationsSettingsListEn {
  _TranslationsSettingsListEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Settings';
  late final _TranslationsSettingsListBlocksEn blocks =
      _TranslationsSettingsListBlocksEn._(_root);
}

// Path: settings.theme
class _TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Theme';
  late final _TranslationsSettingsThemeValuesEn values =
      _TranslationsSettingsThemeValuesEn._(_root);
}

// Path: settings.storage
class _TranslationsSettingsStorageEn {
  _TranslationsSettingsStorageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Backup data (work in progress)';
  String get aboutHeader => 'How it works';
  String get aboutContent =>
      'You can export all of your app data into single JSON file and then import at any time on any device.\n⚠️ Warning: while app is in early stage of development, data and formats between versions can be changed and then data can be lost.\n';
  String get importTitle => 'Import';
  String get exportTitle => 'Export';
  late final _TranslationsSettingsStorageImportStatusEn importStatus =
      _TranslationsSettingsStorageImportStatusEn._(_root);
  late final _TranslationsSettingsStorageExportStatusEn exportStatus =
      _TranslationsSettingsStorageExportStatusEn._(_root);
  String get closeAppButton => 'Close this app!';
}

// Path: settings.about
class _TranslationsSettingsAboutEn {
  _TranslationsSettingsAboutEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'About';
  late final _TranslationsSettingsAboutBlocksEn blocks =
      _TranslationsSettingsAboutBlocksEn._(_root);
}

// Path: stats.quickView
class _TranslationsStatsQuickViewEn {
  _TranslationsStatsQuickViewEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Statistics';
  String get weeklyChart => 'Points per day';
}

// Path: tags.creation
class _TranslationsTagsCreationEn {
  _TranslationsTagsCreationEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsTagsCreationTitleEn title =
      _TranslationsTagsCreationTitleEn._(_root);
  late final _TranslationsTagsCreationFieldsEn fields =
      _TranslationsTagsCreationFieldsEn._(_root);
  String get submit => 'Save';
  late final _TranslationsTagsCreationDeleteDialogEn deleteDialog =
      _TranslationsTagsCreationDeleteDialogEn._(_root);
  late final _TranslationsTagsCreationTooltipsEn tooltips =
      _TranslationsTagsCreationTooltipsEn._(_root);
}

// Path: tasks.list
class _TranslationsTasksListEn {
  _TranslationsTasksListEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Tasks';
  String titleSelection({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        n,
        one: 'Selected ${n} task',
        other: 'Selected ${n} tasks',
      );
  late final _TranslationsTasksListDeleteDialogEn deleteDialog =
      _TranslationsTasksListDeleteDialogEn._(_root);
  late final _TranslationsTasksListTooltipsEn tooltips =
      _TranslationsTasksListTooltipsEn._(_root);
}

// Path: tasks.view
class _TranslationsTasksViewEn {
  _TranslationsTasksViewEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Task view';
  late final _TranslationsTasksViewTooltipsEn tooltips =
      _TranslationsTasksViewTooltipsEn._(_root);
}

// Path: tasks.edit
class _TranslationsTasksEditEn {
  _TranslationsTasksEditEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsTasksEditTitleEn title =
      _TranslationsTasksEditTitleEn._(_root);
  late final _TranslationsTasksEditFieldsEn fields =
      _TranslationsTasksEditFieldsEn._(_root);
  late final _TranslationsTasksEditSubmitEn submit =
      _TranslationsTasksEditSubmitEn._(_root);
  late final _TranslationsTasksEditDeleteDialogEn deleteDialog =
      _TranslationsTasksEditDeleteDialogEn._(_root);
  late final _TranslationsTasksEditTooltipsEn tooltips =
      _TranslationsTasksEditTooltipsEn._(_root);
}

// Path: settings.list.blocks
class _TranslationsSettingsListBlocksEn {
  _TranslationsSettingsListBlocksEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get lookAndFeel => 'Look and feel';
  String get storage => 'Storage';
  String get other => 'Other';
}

// Path: settings.theme.values
class _TranslationsSettingsThemeValuesEn {
  _TranslationsSettingsThemeValuesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get light => 'Light theme';
  String get dark => 'Dark theme';
  String get system => 'Prefer system theme';
}

// Path: settings.storage.importStatus
class _TranslationsSettingsStorageImportStatusEn {
  _TranslationsSettingsStorageImportStatusEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get process => 'Importing your data...';
  String get successTitle => 'Restart required';
  String get success =>
      'You successfully imported app\'s data!\nFor finishing this process, please restart this app\n';
  String get failure =>
      'Something went wrong. Your data wasn\'t imported :(\nTry again on some other file\n';
}

// Path: settings.storage.exportStatus
class _TranslationsSettingsStorageExportStatusEn {
  _TranslationsSettingsStorageExportStatusEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get process => 'Exporting your data...';
  String get success => 'You successfully exported your data!';
  String get failure =>
      'Something went wrong. Your data wasn\'t exported ;(\nTry to restart an app\n';
}

// Path: settings.about.blocks
class _TranslationsSettingsAboutBlocksEn {
  _TranslationsSettingsAboutBlocksEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get version => 'App version';
  String get links => 'Links';
  String get telegram => 'Telegram';
  String get repository => 'Repository';
  String get licenses => 'Licenses';
}

// Path: tags.creation.title
class _TranslationsTagsCreationTitleEn {
  _TranslationsTagsCreationTitleEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get create => 'New tag';
  String get existing => 'Edit tag';
}

// Path: tags.creation.fields
class _TranslationsTagsCreationFieldsEn {
  _TranslationsTagsCreationFieldsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get name => 'Name';
  String get color => 'Tag color';
}

// Path: tags.creation.deleteDialog
class _TranslationsTagsCreationDeleteDialogEn {
  _TranslationsTagsCreationDeleteDialogEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get content =>
      'Are you sure you want delete this tag?\nAll tasks with this tag lose it too\n';
}

// Path: tags.creation.tooltips
class _TranslationsTagsCreationTooltipsEn {
  _TranslationsTagsCreationTooltipsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get deleteTagButton => 'Delete';
}

// Path: tasks.list.deleteDialog
class _TranslationsTasksListDeleteDialogEn {
  _TranslationsTasksListDeleteDialogEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String content({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        n,
        one: 'Are you sure you want delete selected task?',
        other: 'Are you sure you want delete ${n} selected tasks?',
      );
}

// Path: tasks.list.tooltips
class _TranslationsTasksListTooltipsEn {
  _TranslationsTasksListTooltipsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get deleteSelectedButton => 'Delete selected';
  String get selectAllButton => 'Select all';
  String get removeSelectionButton => 'Remove selection';
  String get addNewButton => 'Add new task';
}

// Path: tasks.view.tooltips
class _TranslationsTasksViewTooltipsEn {
  _TranslationsTasksViewTooltipsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get editTaskButton => 'Edit';
}

// Path: tasks.edit.title
class _TranslationsTasksEditTitleEn {
  _TranslationsTasksEditTitleEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get create => 'New task';
  String get existing => 'Edit task';
}

// Path: tasks.edit.fields
class _TranslationsTasksEditFieldsEn {
  _TranslationsTasksEditFieldsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get taskTitle => 'Title';
  String get taskDescription => 'Description';
  String get taskPersistence => 'Keep this task until complete';
}

// Path: tasks.edit.submit
class _TranslationsTasksEditSubmitEn {
  _TranslationsTasksEditSubmitEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get create => 'Create new task!';
  String get existing => 'Save changes';
}

// Path: tasks.edit.deleteDialog
class _TranslationsTasksEditDeleteDialogEn {
  _TranslationsTasksEditDeleteDialogEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get content => 'Are you sure you want delete this task?';
}

// Path: tasks.edit.tooltips
class _TranslationsTasksEditTooltipsEn {
  _TranslationsTasksEditTooltipsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get deleteTaskButton => 'Delete';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'common.dialog.confirmTitle':
        return 'Confirm?';
      case 'common.dialog.cancelButton':
        return 'Cancel';
      case 'common.dialog.okButton':
        return 'Yes';
      case 'common.dialog.deleteTitle':
        return 'Confirm deletion';
      case 'common.dialog.deleteButton':
        return 'Delete';
      case 'common.dialog.webSaveTitle':
        return 'Save file';
      case 'common.dialog.exitTitle':
        return 'Confirm exit';
      case 'common.dialog.exitContent':
        return 'Are you sure you want exit this page? All changes will be lost!';
      case 'common.timeSubtitle.createdAt':
        return ({required Object time}) => 'created at ${time}';
      case 'common.timeSubtitle.modifiedAt':
        return ({required Object time}) => 'modified at ${time}';
      case 'common.timeSubtitle.completedAt':
        return ({required Object time}) => 'completed at ${time}';
      case 'common.copy.defaultText':
        return 'Copy content';
      case 'common.copy.completedText':
        return 'Copied!';
      case 'common.timeOptions.today':
        return 'Today';
      case 'common.timeOptions.yesterday':
        return 'Yesterday';
      case 'common.timeOptions.tomorrow':
        return 'Tomorrow';
      case 'settings.list.title':
        return 'Settings';
      case 'settings.list.blocks.lookAndFeel':
        return 'Look and feel';
      case 'settings.list.blocks.storage':
        return 'Storage';
      case 'settings.list.blocks.other':
        return 'Other';
      case 'settings.theme.title':
        return 'Theme';
      case 'settings.theme.values.light':
        return 'Light theme';
      case 'settings.theme.values.dark':
        return 'Dark theme';
      case 'settings.theme.values.system':
        return 'Prefer system theme';
      case 'settings.storage.title':
        return 'Backup data (work in progress)';
      case 'settings.storage.aboutHeader':
        return 'How it works';
      case 'settings.storage.aboutContent':
        return 'You can export all of your app data into single JSON file and then import at any time on any device.\n⚠️ Warning: while app is in early stage of development, data and formats between versions can be changed and then data can be lost.\n';
      case 'settings.storage.importTitle':
        return 'Import';
      case 'settings.storage.exportTitle':
        return 'Export';
      case 'settings.storage.importStatus.process':
        return 'Importing your data...';
      case 'settings.storage.importStatus.successTitle':
        return 'Restart required';
      case 'settings.storage.importStatus.success':
        return 'You successfully imported app\'s data!\nFor finishing this process, please restart this app\n';
      case 'settings.storage.importStatus.failure':
        return 'Something went wrong. Your data wasn\'t imported :(\nTry again on some other file\n';
      case 'settings.storage.exportStatus.process':
        return 'Exporting your data...';
      case 'settings.storage.exportStatus.success':
        return 'You successfully exported your data!';
      case 'settings.storage.exportStatus.failure':
        return 'Something went wrong. Your data wasn\'t exported ;(\nTry to restart an app\n';
      case 'settings.storage.closeAppButton':
        return 'Close this app!';
      case 'settings.about.title':
        return 'About';
      case 'settings.about.blocks.version':
        return 'App version';
      case 'settings.about.blocks.links':
        return 'Links';
      case 'settings.about.blocks.telegram':
        return 'Telegram';
      case 'settings.about.blocks.repository':
        return 'Repository';
      case 'settings.about.blocks.licenses':
        return 'Licenses';
      case 'stats.quickView.title':
        return 'Statistics';
      case 'stats.quickView.weeklyChart':
        return 'Points per day';
      case 'tags.creation.title.create':
        return 'New tag';
      case 'tags.creation.title.existing':
        return 'Edit tag';
      case 'tags.creation.fields.name':
        return 'Name';
      case 'tags.creation.fields.color':
        return 'Tag color';
      case 'tags.creation.submit':
        return 'Save';
      case 'tags.creation.deleteDialog.content':
        return 'Are you sure you want delete this tag?\nAll tasks with this tag lose it too\n';
      case 'tags.creation.tooltips.deleteTagButton':
        return 'Delete';
      case 'tasks.list.title':
        return 'Tasks';
      case 'tasks.list.titleSelection':
        return ({required num n}) =>
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
              n,
              one: 'Selected ${n} task',
              other: 'Selected ${n} tasks',
            );
      case 'tasks.list.deleteDialog.content':
        return ({required num n}) =>
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
              n,
              one: 'Are you sure you want delete selected task?',
              other: 'Are you sure you want delete ${n} selected tasks?',
            );
      case 'tasks.list.tooltips.deleteSelectedButton':
        return 'Delete selected';
      case 'tasks.list.tooltips.selectAllButton':
        return 'Select all';
      case 'tasks.list.tooltips.removeSelectionButton':
        return 'Remove selection';
      case 'tasks.list.tooltips.addNewButton':
        return 'Add new task';
      case 'tasks.view.title':
        return 'Task view';
      case 'tasks.view.tooltips.editTaskButton':
        return 'Edit';
      case 'tasks.edit.title.create':
        return 'New task';
      case 'tasks.edit.title.existing':
        return 'Edit task';
      case 'tasks.edit.fields.taskTitle':
        return 'Title';
      case 'tasks.edit.fields.taskDescription':
        return 'Description';
      case 'tasks.edit.fields.taskPersistence':
        return 'Keep this task until complete';
      case 'tasks.edit.submit.create':
        return 'Create new task!';
      case 'tasks.edit.submit.existing':
        return 'Save changes';
      case 'tasks.edit.deleteDialog.content':
        return 'Are you sure you want delete this task?';
      case 'tasks.edit.tooltips.deleteTaskButton':
        return 'Delete';
      default:
        return null;
    }
  }
}
