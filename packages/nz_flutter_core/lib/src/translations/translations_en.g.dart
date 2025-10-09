///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsStatsEn stats = TranslationsStatsEn._(_root);
	late final TranslationsTagsEn tags = TranslationsTagsEn._(_root);
	late final TranslationsTasksEn tasks = TranslationsTasksEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonDialogEn dialog = TranslationsCommonDialogEn._(_root);
	late final TranslationsCommonTimeSubtitleEn timeSubtitle = TranslationsCommonTimeSubtitleEn._(_root);
	late final TranslationsCommonCopyEn copy = TranslationsCommonCopyEn._(_root);
	late final TranslationsCommonTimeOptionsEn timeOptions = TranslationsCommonTimeOptionsEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsListEn list = TranslationsSettingsListEn._(_root);
	late final TranslationsSettingsThemeEn theme = TranslationsSettingsThemeEn._(_root);
	late final TranslationsSettingsStorageEn storage = TranslationsSettingsStorageEn._(_root);
	late final TranslationsSettingsAboutEn about = TranslationsSettingsAboutEn._(_root);
}

// Path: stats
class TranslationsStatsEn {
	TranslationsStatsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsStatsQuickViewEn quickView = TranslationsStatsQuickViewEn._(_root);
}

// Path: tags
class TranslationsTagsEn {
	TranslationsTagsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTagsCreationEn creation = TranslationsTagsCreationEn._(_root);
}

// Path: tasks
class TranslationsTasksEn {
	TranslationsTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTasksListEn list = TranslationsTasksListEn._(_root);
	late final TranslationsTasksViewEn view = TranslationsTasksViewEn._(_root);
	late final TranslationsTasksEditEn edit = TranslationsTasksEditEn._(_root);
}

// Path: common.dialog
class TranslationsCommonDialogEn {
	TranslationsCommonDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm?'
	String get confirmTitle => 'Confirm?';

	/// en: 'Cancel'
	String get cancelButton => 'Cancel';

	/// en: 'Yes'
	String get okButton => 'Yes';

	/// en: 'Confirm deletion'
	String get deleteTitle => 'Confirm deletion';

	/// en: 'Delete'
	String get deleteButton => 'Delete';

	/// en: 'Save file'
	String get webSaveTitle => 'Save file';

	/// en: 'Confirm exit'
	String get exitTitle => 'Confirm exit';

	/// en: 'Are you sure you want exit this page? All changes will be lost!'
	String get exitContent => 'Are you sure you want exit this page? All changes will be lost!';
}

// Path: common.timeSubtitle
class TranslationsCommonTimeSubtitleEn {
	TranslationsCommonTimeSubtitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'created at ${time}'
	String createdAt({required Object time}) => 'created at ${time}';

	/// en: 'modified at ${time}'
	String modifiedAt({required Object time}) => 'modified at ${time}';

	/// en: 'completed at ${time}'
	String completedAt({required Object time}) => 'completed at ${time}';
}

// Path: common.copy
class TranslationsCommonCopyEn {
	TranslationsCommonCopyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Copy content'
	String get defaultText => 'Copy content';

	/// en: 'Copied!'
	String get completedText => 'Copied!';
}

// Path: common.timeOptions
class TranslationsCommonTimeOptionsEn {
	TranslationsCommonTimeOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';
}

// Path: settings.list
class TranslationsSettingsListEn {
	TranslationsSettingsListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsListBlocksEn blocks = TranslationsSettingsListBlocksEn._(_root);
}

// Path: settings.theme
class TranslationsSettingsThemeEn {
	TranslationsSettingsThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Theme'
	String get title => 'Theme';

	late final TranslationsSettingsThemeUseDynamicColorsOptionEn useDynamicColorsOption = TranslationsSettingsThemeUseDynamicColorsOptionEn._(_root);
	late final TranslationsSettingsThemeHarmonizeColorsEn harmonizeColors = TranslationsSettingsThemeHarmonizeColorsEn._(_root);
	late final TranslationsSettingsThemeValuesEn values = TranslationsSettingsThemeValuesEn._(_root);
}

// Path: settings.storage
class TranslationsSettingsStorageEn {
	TranslationsSettingsStorageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Backup data (work in progress)'
	String get title => 'Backup data (work in progress)';

	/// en: 'How it works'
	String get aboutHeader => 'How it works';

	/// en: 'You can export all of your app data into single JSON file and then import at any time on any device. ⚠️ Warning: while app is in early stage of development, data and formats between versions can be changed and then data can be lost. '
	String get aboutContent => 'You can export all of your app data into single JSON file and then import at any time on any device.\n⚠️ Warning: while app is in early stage of development, data and formats between versions can be changed and then data can be lost.\n';

	/// en: 'Import'
	String get importTitle => 'Import';

	/// en: 'Export'
	String get exportTitle => 'Export';

	late final TranslationsSettingsStorageImportStatusEn importStatus = TranslationsSettingsStorageImportStatusEn._(_root);
	late final TranslationsSettingsStorageExportStatusEn exportStatus = TranslationsSettingsStorageExportStatusEn._(_root);

	/// en: 'Close this app!'
	String get closeAppButton => 'Close this app!';
}

// Path: settings.about
class TranslationsSettingsAboutEn {
	TranslationsSettingsAboutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get title => 'About';

	late final TranslationsSettingsAboutBlocksEn blocks = TranslationsSettingsAboutBlocksEn._(_root);
}

// Path: stats.quickView
class TranslationsStatsQuickViewEn {
	TranslationsStatsQuickViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Statistics'
	String get title => 'Statistics';

	/// en: 'Points per day'
	String get weeklyChart => 'Points per day';
}

// Path: tags.creation
class TranslationsTagsCreationEn {
	TranslationsTagsCreationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTagsCreationTitleEn title = TranslationsTagsCreationTitleEn._(_root);
	late final TranslationsTagsCreationFieldsEn fields = TranslationsTagsCreationFieldsEn._(_root);

	/// en: 'Save'
	String get submit => 'Save';

	late final TranslationsTagsCreationDeleteDialogEn deleteDialog = TranslationsTagsCreationDeleteDialogEn._(_root);
	late final TranslationsTagsCreationTooltipsEn tooltips = TranslationsTagsCreationTooltipsEn._(_root);
}

// Path: tasks.list
class TranslationsTasksListEn {
	TranslationsTasksListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tasks'
	String get title => 'Tasks';

	/// en: '(one) {Selected $n task} (other) {Selected $n tasks}'
	String titleSelection({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Selected ${n} task',
		other: 'Selected ${n} tasks',
	);

	late final TranslationsTasksListDeleteDialogEn deleteDialog = TranslationsTasksListDeleteDialogEn._(_root);
	late final TranslationsTasksListTooltipsEn tooltips = TranslationsTasksListTooltipsEn._(_root);
	late final TranslationsTasksListAppBarActionsEn appBarActions = TranslationsTasksListAppBarActionsEn._(_root);

	/// en: 'Cancel tasks'
	String get cancelButton => 'Cancel tasks';

	/// en: 'Canceled'
	String get canceledTaskMark => 'Canceled';

	late final TranslationsTasksListEmptyEn empty = TranslationsTasksListEmptyEn._(_root);
}

// Path: tasks.view
class TranslationsTasksViewEn {
	TranslationsTasksViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Task view'
	String get title => 'Task view';

	late final TranslationsTasksViewTooltipsEn tooltips = TranslationsTasksViewTooltipsEn._(_root);
}

// Path: tasks.edit
class TranslationsTasksEditEn {
	TranslationsTasksEditEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTasksEditTitleEn title = TranslationsTasksEditTitleEn._(_root);
	late final TranslationsTasksEditFieldsEn fields = TranslationsTasksEditFieldsEn._(_root);
	late final TranslationsTasksEditSubmitEn submit = TranslationsTasksEditSubmitEn._(_root);
	late final TranslationsTasksEditDeleteDialogEn deleteDialog = TranslationsTasksEditDeleteDialogEn._(_root);
	late final TranslationsTasksEditTooltipsEn tooltips = TranslationsTasksEditTooltipsEn._(_root);
}

// Path: settings.list.blocks
class TranslationsSettingsListBlocksEn {
	TranslationsSettingsListBlocksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Look and feel'
	String get lookAndFeel => 'Look and feel';

	/// en: 'Storage'
	String get storage => 'Storage';

	/// en: 'Other'
	String get other => 'Other';
}

// Path: settings.theme.useDynamicColorsOption
class TranslationsSettingsThemeUseDynamicColorsOptionEn {
	TranslationsSettingsThemeUseDynamicColorsOptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Use dynamic colors'
	String get title => 'Use dynamic colors';

	/// en: 'App's theme would adapt on system accent colors'
	String get subtitle => 'App\'s theme would adapt on system accent colors';

	/// en: 'Dynamic colors aren't available on this platform'
	String get subttileUnavailable => 'Dynamic colors aren\'t available on this platform';
}

// Path: settings.theme.harmonizeColors
class TranslationsSettingsThemeHarmonizeColorsEn {
	TranslationsSettingsThemeHarmonizeColorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Harmonized colors'
	String get title => 'Harmonized colors';

	/// en: 'All the custom colors would be more integrated into app theme'
	String get subtitle => 'All the custom colors would be more integrated into app theme';
}

// Path: settings.theme.values
class TranslationsSettingsThemeValuesEn {
	TranslationsSettingsThemeValuesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Light theme'
	String get light => 'Light theme';

	/// en: 'Dark theme'
	String get dark => 'Dark theme';

	/// en: 'Prefer system theme'
	String get system => 'Prefer system theme';
}

// Path: settings.storage.importStatus
class TranslationsSettingsStorageImportStatusEn {
	TranslationsSettingsStorageImportStatusEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Importing your data...'
	String get process => 'Importing your data...';

	/// en: 'Restart required'
	String get successTitle => 'Restart required';

	/// en: 'You successfully imported app's data! For finishing this process, please restart this app '
	String get success => 'You successfully imported app\'s data!\nFor finishing this process, please restart this app\n';

	/// en: 'Something went wrong. Your data wasn't imported :( Try again on some other file '
	String get failure => 'Something went wrong. Your data wasn\'t imported :(\nTry again on some other file\n';
}

// Path: settings.storage.exportStatus
class TranslationsSettingsStorageExportStatusEn {
	TranslationsSettingsStorageExportStatusEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Exporting your data...'
	String get process => 'Exporting your data...';

	/// en: 'You successfully exported your data!'
	String get success => 'You successfully exported your data!';

	/// en: 'Something went wrong. Your data wasn't exported ;( Try to restart an app '
	String get failure => 'Something went wrong. Your data wasn\'t exported ;(\nTry to restart an app\n';
}

// Path: settings.about.blocks
class TranslationsSettingsAboutBlocksEn {
	TranslationsSettingsAboutBlocksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App version'
	String get version => 'App version';

	/// en: 'Links'
	String get links => 'Links';

	/// en: 'Telegram'
	String get telegram => 'Telegram';

	/// en: 'Repository'
	String get repository => 'Repository';

	/// en: 'Licenses'
	String get licenses => 'Licenses';
}

// Path: tags.creation.title
class TranslationsTagsCreationTitleEn {
	TranslationsTagsCreationTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New tag'
	String get create => 'New tag';

	/// en: 'Edit tag'
	String get existing => 'Edit tag';
}

// Path: tags.creation.fields
class TranslationsTagsCreationFieldsEn {
	TranslationsTagsCreationFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Tag color'
	String get color => 'Tag color';
}

// Path: tags.creation.deleteDialog
class TranslationsTagsCreationDeleteDialogEn {
	TranslationsTagsCreationDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Are you sure you want delete this tag? All tasks with this tag lose it too '
	String get content => 'Are you sure you want delete this tag?\nAll tasks with this tag lose it too\n';
}

// Path: tags.creation.tooltips
class TranslationsTagsCreationTooltipsEn {
	TranslationsTagsCreationTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete'
	String get deleteTagButton => 'Delete';
}

// Path: tasks.list.deleteDialog
class TranslationsTasksListDeleteDialogEn {
	TranslationsTasksListDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '(one) {Are you sure you want delete selected task?} (other) {Are you sure you want delete $n selected tasks?}'
	String content({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Are you sure you want delete selected task?',
		other: 'Are you sure you want delete ${n} selected tasks?',
	);
}

// Path: tasks.list.tooltips
class TranslationsTasksListTooltipsEn {
	TranslationsTasksListTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete selected'
	String get deleteSelectedButton => 'Delete selected';

	/// en: 'Select all'
	String get selectAllButton => 'Select all';

	/// en: 'Remove selection'
	String get removeSelectionButton => 'Remove selection';

	/// en: 'Add new task'
	String get addNewButton => 'Add new task';

	/// en: 'Reopen'
	String get canceledMarkButton => 'Reopen';
}

// Path: tasks.list.appBarActions
class TranslationsTasksListAppBarActionsEn {
	TranslationsTasksListAppBarActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTasksListAppBarActionsPopupMenuEn popupMenu = TranslationsTasksListAppBarActionsPopupMenuEn._(_root);
}

// Path: tasks.list.empty
class TranslationsTasksListEmptyEn {
	TranslationsTasksListEmptyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '¯\\_(ツ)_/¯'
	String get icon => '¯\\_(ツ)_/¯';

	/// en: 'There is no tasks'
	String get title => 'There is no tasks';

	/// en: 'Create a new one'
	String get button => 'Create a new one';

	/// en: 'There is no tasks with such filters'
	String get titleFilters => 'There is no tasks with such filters';

	/// en: 'Reset filters'
	String get buttonFilters => 'Reset filters';
}

// Path: tasks.view.tooltips
class TranslationsTasksViewTooltipsEn {
	TranslationsTasksViewTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit'
	String get editTaskButton => 'Edit';
}

// Path: tasks.edit.title
class TranslationsTasksEditTitleEn {
	TranslationsTasksEditTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New task'
	String get create => 'New task';

	/// en: 'Edit task'
	String get existing => 'Edit task';
}

// Path: tasks.edit.fields
class TranslationsTasksEditFieldsEn {
	TranslationsTasksEditFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get taskTitle => 'Title';

	/// en: 'Description'
	String get taskDescription => 'Description';

	/// en: 'Someday'
	String get taskForSomeday => 'Someday';

	/// en: 'Keep this task until complete'
	String get taskPersistence => 'Keep this task until complete';
}

// Path: tasks.edit.submit
class TranslationsTasksEditSubmitEn {
	TranslationsTasksEditSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create new task!'
	String get create => 'Create new task!';

	/// en: 'Save changes'
	String get existing => 'Save changes';
}

// Path: tasks.edit.deleteDialog
class TranslationsTasksEditDeleteDialogEn {
	TranslationsTasksEditDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Are you sure you want delete this task?'
	String get content => 'Are you sure you want delete this task?';
}

// Path: tasks.edit.tooltips
class TranslationsTasksEditTooltipsEn {
	TranslationsTasksEditTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete'
	String get deleteTaskButton => 'Delete';
}

// Path: tasks.list.appBarActions.popupMenu
class TranslationsTasksListAppBarActionsPopupMenuEn {
	TranslationsTasksListAppBarActionsPopupMenuEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Show canceled'
	String get showCanceledOption => 'Show canceled';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.dialog.confirmTitle': return 'Confirm?';
			case 'common.dialog.cancelButton': return 'Cancel';
			case 'common.dialog.okButton': return 'Yes';
			case 'common.dialog.deleteTitle': return 'Confirm deletion';
			case 'common.dialog.deleteButton': return 'Delete';
			case 'common.dialog.webSaveTitle': return 'Save file';
			case 'common.dialog.exitTitle': return 'Confirm exit';
			case 'common.dialog.exitContent': return 'Are you sure you want exit this page? All changes will be lost!';
			case 'common.timeSubtitle.createdAt': return ({required Object time}) => 'created at ${time}';
			case 'common.timeSubtitle.modifiedAt': return ({required Object time}) => 'modified at ${time}';
			case 'common.timeSubtitle.completedAt': return ({required Object time}) => 'completed at ${time}';
			case 'common.copy.defaultText': return 'Copy content';
			case 'common.copy.completedText': return 'Copied!';
			case 'common.timeOptions.today': return 'Today';
			case 'common.timeOptions.yesterday': return 'Yesterday';
			case 'common.timeOptions.tomorrow': return 'Tomorrow';
			case 'settings.list.title': return 'Settings';
			case 'settings.list.blocks.lookAndFeel': return 'Look and feel';
			case 'settings.list.blocks.storage': return 'Storage';
			case 'settings.list.blocks.other': return 'Other';
			case 'settings.theme.title': return 'Theme';
			case 'settings.theme.useDynamicColorsOption.title': return 'Use dynamic colors';
			case 'settings.theme.useDynamicColorsOption.subtitle': return 'App\'s theme would adapt on system accent colors';
			case 'settings.theme.useDynamicColorsOption.subttileUnavailable': return 'Dynamic colors aren\'t available on this platform';
			case 'settings.theme.harmonizeColors.title': return 'Harmonized colors';
			case 'settings.theme.harmonizeColors.subtitle': return 'All the custom colors would be more integrated into app theme';
			case 'settings.theme.values.light': return 'Light theme';
			case 'settings.theme.values.dark': return 'Dark theme';
			case 'settings.theme.values.system': return 'Prefer system theme';
			case 'settings.storage.title': return 'Backup data (work in progress)';
			case 'settings.storage.aboutHeader': return 'How it works';
			case 'settings.storage.aboutContent': return 'You can export all of your app data into single JSON file and then import at any time on any device.\n⚠️ Warning: while app is in early stage of development, data and formats between versions can be changed and then data can be lost.\n';
			case 'settings.storage.importTitle': return 'Import';
			case 'settings.storage.exportTitle': return 'Export';
			case 'settings.storage.importStatus.process': return 'Importing your data...';
			case 'settings.storage.importStatus.successTitle': return 'Restart required';
			case 'settings.storage.importStatus.success': return 'You successfully imported app\'s data!\nFor finishing this process, please restart this app\n';
			case 'settings.storage.importStatus.failure': return 'Something went wrong. Your data wasn\'t imported :(\nTry again on some other file\n';
			case 'settings.storage.exportStatus.process': return 'Exporting your data...';
			case 'settings.storage.exportStatus.success': return 'You successfully exported your data!';
			case 'settings.storage.exportStatus.failure': return 'Something went wrong. Your data wasn\'t exported ;(\nTry to restart an app\n';
			case 'settings.storage.closeAppButton': return 'Close this app!';
			case 'settings.about.title': return 'About';
			case 'settings.about.blocks.version': return 'App version';
			case 'settings.about.blocks.links': return 'Links';
			case 'settings.about.blocks.telegram': return 'Telegram';
			case 'settings.about.blocks.repository': return 'Repository';
			case 'settings.about.blocks.licenses': return 'Licenses';
			case 'stats.quickView.title': return 'Statistics';
			case 'stats.quickView.weeklyChart': return 'Points per day';
			case 'tags.creation.title.create': return 'New tag';
			case 'tags.creation.title.existing': return 'Edit tag';
			case 'tags.creation.fields.name': return 'Name';
			case 'tags.creation.fields.color': return 'Tag color';
			case 'tags.creation.submit': return 'Save';
			case 'tags.creation.deleteDialog.content': return 'Are you sure you want delete this tag?\nAll tasks with this tag lose it too\n';
			case 'tags.creation.tooltips.deleteTagButton': return 'Delete';
			case 'tasks.list.title': return 'Tasks';
			case 'tasks.list.titleSelection': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Selected ${n} task',
				other: 'Selected ${n} tasks',
			);
			case 'tasks.list.deleteDialog.content': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Are you sure you want delete selected task?',
				other: 'Are you sure you want delete ${n} selected tasks?',
			);
			case 'tasks.list.tooltips.deleteSelectedButton': return 'Delete selected';
			case 'tasks.list.tooltips.selectAllButton': return 'Select all';
			case 'tasks.list.tooltips.removeSelectionButton': return 'Remove selection';
			case 'tasks.list.tooltips.addNewButton': return 'Add new task';
			case 'tasks.list.tooltips.canceledMarkButton': return 'Reopen';
			case 'tasks.list.appBarActions.popupMenu.showCanceledOption': return 'Show canceled';
			case 'tasks.list.cancelButton': return 'Cancel tasks';
			case 'tasks.list.canceledTaskMark': return 'Canceled';
			case 'tasks.list.empty.icon': return '¯\\_(ツ)_/¯';
			case 'tasks.list.empty.title': return 'There is no tasks';
			case 'tasks.list.empty.button': return 'Create a new one';
			case 'tasks.list.empty.titleFilters': return 'There is no tasks with such filters';
			case 'tasks.list.empty.buttonFilters': return 'Reset filters';
			case 'tasks.view.title': return 'Task view';
			case 'tasks.view.tooltips.editTaskButton': return 'Edit';
			case 'tasks.edit.title.create': return 'New task';
			case 'tasks.edit.title.existing': return 'Edit task';
			case 'tasks.edit.fields.taskTitle': return 'Title';
			case 'tasks.edit.fields.taskDescription': return 'Description';
			case 'tasks.edit.fields.taskForSomeday': return 'Someday';
			case 'tasks.edit.fields.taskPersistence': return 'Keep this task until complete';
			case 'tasks.edit.submit.create': return 'Create new task!';
			case 'tasks.edit.submit.existing': return 'Save changes';
			case 'tasks.edit.deleteDialog.content': return 'Are you sure you want delete this task?';
			case 'tasks.edit.tooltips.deleteTaskButton': return 'Delete';
			default: return null;
		}
	}
}

