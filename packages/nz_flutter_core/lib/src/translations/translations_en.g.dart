///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
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
	late final TranslationsHabitsEn habits = TranslationsHabitsEn._(_root);
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

// Path: habits
class TranslationsHabitsEn {
	TranslationsHabitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHabitsListEn list = TranslationsHabitsListEn._(_root);
	late final TranslationsHabitsViewEn view = TranslationsHabitsViewEn._(_root);
	late final TranslationsHabitsEditEn edit = TranslationsHabitsEditEn._(_root);
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

// Path: habits.list
class TranslationsHabitsListEn {
	TranslationsHabitsListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Habits'
	String get title => 'Habits';

	late final TranslationsHabitsListTooltipsEn tooltips = TranslationsHabitsListTooltipsEn._(_root);
}

// Path: habits.view
class TranslationsHabitsViewEn {
	TranslationsHabitsViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Habit view'
	String get title => 'Habit view';

	late final TranslationsHabitsViewTooltipsEn tooltips = TranslationsHabitsViewTooltipsEn._(_root);
}

// Path: habits.edit
class TranslationsHabitsEditEn {
	TranslationsHabitsEditEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHabitsEditTitleEn title = TranslationsHabitsEditTitleEn._(_root);
	late final TranslationsHabitsEditFieldsEn fields = TranslationsHabitsEditFieldsEn._(_root);
	late final TranslationsHabitsEditSubmitEn submit = TranslationsHabitsEditSubmitEn._(_root);
	late final TranslationsHabitsEditDeleteDialogEn deleteDialog = TranslationsHabitsEditDeleteDialogEn._(_root);
	late final TranslationsHabitsEditTooltipsEn tooltips = TranslationsHabitsEditTooltipsEn._(_root);
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

	/// en: '(zero) {No tasks left to complete} (one) {$n task left to complete} (other) {$n tasks left to complete}'
	String tasksLeftToComplete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No tasks left to complete',
		one: '${n} task left to complete',
		other: '${n} tasks left to complete',
	);

	late final TranslationsTasksListEmptyEn empty = TranslationsTasksListEmptyEn._(_root);
	late final TranslationsTasksListPlanningEn planning = TranslationsTasksListPlanningEn._(_root);
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

// Path: habits.list.tooltips
class TranslationsHabitsListTooltipsEn {
	TranslationsHabitsListTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add new habit'
	String get addNewButton => 'Add new habit';
}

// Path: habits.view.tooltips
class TranslationsHabitsViewTooltipsEn {
	TranslationsHabitsViewTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit'
	String get editHabitButton => 'Edit';
}

// Path: habits.edit.title
class TranslationsHabitsEditTitleEn {
	TranslationsHabitsEditTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New habit'
	String get create => 'New habit';

	/// en: 'Edit habit'
	String get existing => 'Edit habit';
}

// Path: habits.edit.fields
class TranslationsHabitsEditFieldsEn {
	TranslationsHabitsEditFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get habitTitle => 'Title';

	/// en: 'Description'
	String get habitDescription => 'Description';

	/// en: 'Regularity (Currently unavailable)'
	String get habitRegularity => 'Regularity (Currently unavailable)';

	/// en: 'Daily'
	String get habitRegularityDaily => 'Daily';
}

// Path: habits.edit.submit
class TranslationsHabitsEditSubmitEn {
	TranslationsHabitsEditSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create new habit!'
	String get create => 'Create new habit!';

	/// en: 'Save changes'
	String get existing => 'Save changes';
}

// Path: habits.edit.deleteDialog
class TranslationsHabitsEditDeleteDialogEn {
	TranslationsHabitsEditDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Are you sure you want delete this habit?'
	String get content => 'Are you sure you want delete this habit?';
}

// Path: habits.edit.tooltips
class TranslationsHabitsEditTooltipsEn {
	TranslationsHabitsEditTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete'
	String get deleteHabitButton => 'Delete';
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

	/// en: 'Select date for the task'
	String get selectDateForSomedayTasksButton => 'Select date for the task';
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

// Path: tasks.list.planning
class TranslationsTasksListPlanningEn {
	TranslationsTasksListPlanningEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tasks for someday'
	String get labelWhenEnabled => 'Tasks for someday';
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

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.dialog.confirmTitle' => 'Confirm?',
			'common.dialog.cancelButton' => 'Cancel',
			'common.dialog.okButton' => 'Yes',
			'common.dialog.deleteTitle' => 'Confirm deletion',
			'common.dialog.deleteButton' => 'Delete',
			'common.dialog.webSaveTitle' => 'Save file',
			'common.dialog.exitTitle' => 'Confirm exit',
			'common.dialog.exitContent' => 'Are you sure you want exit this page? All changes will be lost!',
			'common.timeSubtitle.createdAt' => ({required Object time}) => 'created at ${time}',
			'common.timeSubtitle.modifiedAt' => ({required Object time}) => 'modified at ${time}',
			'common.timeSubtitle.completedAt' => ({required Object time}) => 'completed at ${time}',
			'common.copy.defaultText' => 'Copy content',
			'common.copy.completedText' => 'Copied!',
			'common.timeOptions.today' => 'Today',
			'common.timeOptions.yesterday' => 'Yesterday',
			'common.timeOptions.tomorrow' => 'Tomorrow',
			'habits.list.title' => 'Habits',
			'habits.list.tooltips.addNewButton' => 'Add new habit',
			'habits.view.title' => 'Habit view',
			'habits.view.tooltips.editHabitButton' => 'Edit',
			'habits.edit.title.create' => 'New habit',
			'habits.edit.title.existing' => 'Edit habit',
			'habits.edit.fields.habitTitle' => 'Title',
			'habits.edit.fields.habitDescription' => 'Description',
			'habits.edit.fields.habitRegularity' => 'Regularity (Currently unavailable)',
			'habits.edit.fields.habitRegularityDaily' => 'Daily',
			'habits.edit.submit.create' => 'Create new habit!',
			'habits.edit.submit.existing' => 'Save changes',
			'habits.edit.deleteDialog.content' => 'Are you sure you want delete this habit?',
			'habits.edit.tooltips.deleteHabitButton' => 'Delete',
			'settings.list.title' => 'Settings',
			'settings.list.blocks.lookAndFeel' => 'Look and feel',
			'settings.list.blocks.storage' => 'Storage',
			'settings.list.blocks.other' => 'Other',
			'settings.theme.title' => 'Theme',
			'settings.theme.useDynamicColorsOption.title' => 'Use dynamic colors',
			'settings.theme.useDynamicColorsOption.subtitle' => 'App\'s theme would adapt on system accent colors',
			'settings.theme.useDynamicColorsOption.subttileUnavailable' => 'Dynamic colors aren\'t available on this platform',
			'settings.theme.harmonizeColors.title' => 'Harmonized colors',
			'settings.theme.harmonizeColors.subtitle' => 'All the custom colors would be more integrated into app theme',
			'settings.theme.values.light' => 'Light theme',
			'settings.theme.values.dark' => 'Dark theme',
			'settings.theme.values.system' => 'Prefer system theme',
			'settings.storage.title' => 'Backup data (work in progress)',
			'settings.storage.aboutHeader' => 'How it works',
			'settings.storage.aboutContent' => 'You can export all of your app data into single JSON file and then import at any time on any device.\n⚠️ Warning: while app is in early stage of development, data and formats between versions can be changed and then data can be lost.\n',
			'settings.storage.importTitle' => 'Import',
			'settings.storage.exportTitle' => 'Export',
			'settings.storage.importStatus.process' => 'Importing your data...',
			'settings.storage.importStatus.successTitle' => 'Restart required',
			'settings.storage.importStatus.success' => 'You successfully imported app\'s data!\nFor finishing this process, please restart this app\n',
			'settings.storage.importStatus.failure' => 'Something went wrong. Your data wasn\'t imported :(\nTry again on some other file\n',
			'settings.storage.exportStatus.process' => 'Exporting your data...',
			'settings.storage.exportStatus.success' => 'You successfully exported your data!',
			'settings.storage.exportStatus.failure' => 'Something went wrong. Your data wasn\'t exported ;(\nTry to restart an app\n',
			'settings.storage.closeAppButton' => 'Close this app!',
			'settings.about.title' => 'About',
			'settings.about.blocks.version' => 'App version',
			'settings.about.blocks.links' => 'Links',
			'settings.about.blocks.telegram' => 'Telegram',
			'settings.about.blocks.repository' => 'Repository',
			'settings.about.blocks.licenses' => 'Licenses',
			'stats.quickView.title' => 'Statistics',
			'stats.quickView.weeklyChart' => 'Points per day',
			'tags.creation.title.create' => 'New tag',
			'tags.creation.title.existing' => 'Edit tag',
			'tags.creation.fields.name' => 'Name',
			'tags.creation.fields.color' => 'Tag color',
			'tags.creation.submit' => 'Save',
			'tags.creation.deleteDialog.content' => 'Are you sure you want delete this tag?\nAll tasks with this tag lose it too\n',
			'tags.creation.tooltips.deleteTagButton' => 'Delete',
			'tasks.list.title' => 'Tasks',
			'tasks.list.titleSelection' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Selected ${n} task', other: 'Selected ${n} tasks', ), 
			'tasks.list.deleteDialog.content' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Are you sure you want delete selected task?', other: 'Are you sure you want delete ${n} selected tasks?', ), 
			'tasks.list.tooltips.deleteSelectedButton' => 'Delete selected',
			'tasks.list.tooltips.selectAllButton' => 'Select all',
			'tasks.list.tooltips.removeSelectionButton' => 'Remove selection',
			'tasks.list.tooltips.addNewButton' => 'Add new task',
			'tasks.list.tooltips.canceledMarkButton' => 'Reopen',
			'tasks.list.tooltips.selectDateForSomedayTasksButton' => 'Select date for the task',
			'tasks.list.appBarActions.popupMenu.showCanceledOption' => 'Show canceled',
			'tasks.list.cancelButton' => 'Cancel tasks',
			'tasks.list.canceledTaskMark' => 'Canceled',
			'tasks.list.tasksLeftToComplete' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'No tasks left to complete', one: '${n} task left to complete', other: '${n} tasks left to complete', ), 
			'tasks.list.empty.icon' => '¯\\_(ツ)_/¯',
			'tasks.list.empty.title' => 'There is no tasks',
			'tasks.list.empty.button' => 'Create a new one',
			'tasks.list.empty.titleFilters' => 'There is no tasks with such filters',
			'tasks.list.empty.buttonFilters' => 'Reset filters',
			'tasks.list.planning.labelWhenEnabled' => 'Tasks for someday',
			'tasks.view.title' => 'Task view',
			'tasks.view.tooltips.editTaskButton' => 'Edit',
			'tasks.edit.title.create' => 'New task',
			'tasks.edit.title.existing' => 'Edit task',
			'tasks.edit.fields.taskTitle' => 'Title',
			'tasks.edit.fields.taskDescription' => 'Description',
			'tasks.edit.fields.taskForSomeday' => 'Someday',
			'tasks.edit.fields.taskPersistence' => 'Keep this task until complete',
			'tasks.edit.submit.create' => 'Create new task!',
			'tasks.edit.submit.existing' => 'Save changes',
			'tasks.edit.deleteDialog.content' => 'Are you sure you want delete this task?',
			'tasks.edit.tooltips.deleteTaskButton' => 'Delete',
			_ => null,
		};
	}
}
