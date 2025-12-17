///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonRu common = _TranslationsCommonRu._(_root);
	@override late final _TranslationsHabitsRu habits = _TranslationsHabitsRu._(_root);
	@override late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
	@override late final _TranslationsStatsRu stats = _TranslationsStatsRu._(_root);
	@override late final _TranslationsTagsRu tags = _TranslationsTagsRu._(_root);
	@override late final _TranslationsTasksRu tasks = _TranslationsTasksRu._(_root);
}

// Path: common
class _TranslationsCommonRu implements TranslationsCommonEn {
	_TranslationsCommonRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonDialogRu dialog = _TranslationsCommonDialogRu._(_root);
	@override late final _TranslationsCommonTimeSubtitleRu timeSubtitle = _TranslationsCommonTimeSubtitleRu._(_root);
	@override late final _TranslationsCommonCopyRu copy = _TranslationsCommonCopyRu._(_root);
	@override late final _TranslationsCommonTimeOptionsRu timeOptions = _TranslationsCommonTimeOptionsRu._(_root);
}

// Path: habits
class _TranslationsHabitsRu implements TranslationsHabitsEn {
	_TranslationsHabitsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHabitsListRu list = _TranslationsHabitsListRu._(_root);
	@override late final _TranslationsHabitsViewRu view = _TranslationsHabitsViewRu._(_root);
	@override late final _TranslationsHabitsEditRu edit = _TranslationsHabitsEditRu._(_root);
}

// Path: settings
class _TranslationsSettingsRu implements TranslationsSettingsEn {
	_TranslationsSettingsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsListRu list = _TranslationsSettingsListRu._(_root);
	@override late final _TranslationsSettingsThemeRu theme = _TranslationsSettingsThemeRu._(_root);
	@override late final _TranslationsSettingsSpecialEffectsRu specialEffects = _TranslationsSettingsSpecialEffectsRu._(_root);
	@override late final _TranslationsSettingsStorageRu storage = _TranslationsSettingsStorageRu._(_root);
	@override late final _TranslationsSettingsAboutRu about = _TranslationsSettingsAboutRu._(_root);
}

// Path: stats
class _TranslationsStatsRu implements TranslationsStatsEn {
	_TranslationsStatsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStatsQuickViewRu quickView = _TranslationsStatsQuickViewRu._(_root);
}

// Path: tags
class _TranslationsTagsRu implements TranslationsTagsEn {
	_TranslationsTagsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTagsCreationRu creation = _TranslationsTagsCreationRu._(_root);
}

// Path: tasks
class _TranslationsTasksRu implements TranslationsTasksEn {
	_TranslationsTasksRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTasksListRu list = _TranslationsTasksListRu._(_root);
	@override late final _TranslationsTasksViewRu view = _TranslationsTasksViewRu._(_root);
	@override late final _TranslationsTasksEditRu edit = _TranslationsTasksEditRu._(_root);
}

// Path: common.dialog
class _TranslationsCommonDialogRu implements TranslationsCommonDialogEn {
	_TranslationsCommonDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get confirmTitle => 'Подтвердить?';
	@override String get cancelButton => 'Отмена';
	@override String get okButton => 'Да';
	@override String get deleteTitle => 'Подтвердить удаление';
	@override String get deleteButton => 'Удалить';
	@override String get webSaveTitle => 'Сохранить файл';
	@override String get exitTitle => 'Подтвердить выход';
	@override String get exitContent => 'Вы уверены, что хотите выйти со страницы? Все изменения будут потеряны!';
}

// Path: common.timeSubtitle
class _TranslationsCommonTimeSubtitleRu implements TranslationsCommonTimeSubtitleEn {
	_TranslationsCommonTimeSubtitleRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String createdAt({required Object time}) => 'создано ${time}';
	@override String modifiedAt({required Object time}) => 'изменено ${time}';
	@override String completedAt({required Object time}) => 'выполнено ${time}';
}

// Path: common.copy
class _TranslationsCommonCopyRu implements TranslationsCommonCopyEn {
	_TranslationsCommonCopyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get defaultText => 'Копировать текст';
	@override String get completedText => 'Скопировано!';
}

// Path: common.timeOptions
class _TranslationsCommonTimeOptionsRu implements TranslationsCommonTimeOptionsEn {
	_TranslationsCommonTimeOptionsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get today => 'Сегодня';
	@override String get yesterday => 'Вчера';
	@override String get tomorrow => 'Завтра';
}

// Path: habits.list
class _TranslationsHabitsListRu implements TranslationsHabitsListEn {
	_TranslationsHabitsListRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Привычки';
	@override String titleSelection({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: 'Выбрано ${n} привычек',
		one: 'Выбрана ${n} привычка',
		few: 'Выбрано ${n} привычки',
		many: 'Выбрано ${n} привычек',
		other: 'Выбрано ${n} привычек',
	);
	@override late final _TranslationsHabitsListDeleteDialogRu deleteDialog = _TranslationsHabitsListDeleteDialogRu._(_root);
	@override late final _TranslationsHabitsListTooltipsRu tooltips = _TranslationsHabitsListTooltipsRu._(_root);
	@override late final _TranslationsHabitsListEmptyRu empty = _TranslationsHabitsListEmptyRu._(_root);
}

// Path: habits.view
class _TranslationsHabitsViewRu implements TranslationsHabitsViewEn {
	_TranslationsHabitsViewRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Просмотр привычки';
	@override late final _TranslationsHabitsViewTooltipsRu tooltips = _TranslationsHabitsViewTooltipsRu._(_root);
}

// Path: habits.edit
class _TranslationsHabitsEditRu implements TranslationsHabitsEditEn {
	_TranslationsHabitsEditRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHabitsEditTitleRu title = _TranslationsHabitsEditTitleRu._(_root);
	@override late final _TranslationsHabitsEditFieldsRu fields = _TranslationsHabitsEditFieldsRu._(_root);
	@override late final _TranslationsHabitsEditSubmitRu submit = _TranslationsHabitsEditSubmitRu._(_root);
	@override late final _TranslationsHabitsEditDeleteDialogRu deleteDialog = _TranslationsHabitsEditDeleteDialogRu._(_root);
	@override late final _TranslationsHabitsEditTooltipsRu tooltips = _TranslationsHabitsEditTooltipsRu._(_root);
}

// Path: settings.list
class _TranslationsSettingsListRu implements TranslationsSettingsListEn {
	_TranslationsSettingsListRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override late final _TranslationsSettingsListBlocksRu blocks = _TranslationsSettingsListBlocksRu._(_root);
}

// Path: settings.theme
class _TranslationsSettingsThemeRu implements TranslationsSettingsThemeEn {
	_TranslationsSettingsThemeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Тема';
	@override late final _TranslationsSettingsThemeUseDynamicColorsOptionRu useDynamicColorsOption = _TranslationsSettingsThemeUseDynamicColorsOptionRu._(_root);
	@override late final _TranslationsSettingsThemeHarmonizeColorsRu harmonizeColors = _TranslationsSettingsThemeHarmonizeColorsRu._(_root);
	@override late final _TranslationsSettingsThemeValuesRu values = _TranslationsSettingsThemeValuesRu._(_root);
}

// Path: settings.specialEffects
class _TranslationsSettingsSpecialEffectsRu implements TranslationsSettingsSpecialEffectsEn {
	_TranslationsSettingsSpecialEffectsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Спецэффекты';
}

// Path: settings.storage
class _TranslationsSettingsStorageRu implements TranslationsSettingsStorageEn {
	_TranslationsSettingsStorageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Резервное копирование данных (в разработке)';
	@override String get aboutHeader => 'Как это работает';
	@override String get aboutContent => 'Вы можете экспортировать все данные приложения в один JSON-файл и затем импортировать его в любой момент на любом устройстве.\n⚠️ Внимание: пока приложение на ранней стадии разработки, форматы данных могут меняться между версиями — из-за этого данные могут быть потеряны.\n';
	@override String get importTitle => 'Импорт';
	@override String get exportTitle => 'Экспорт';
	@override late final _TranslationsSettingsStorageImportStatusRu importStatus = _TranslationsSettingsStorageImportStatusRu._(_root);
	@override late final _TranslationsSettingsStorageExportStatusRu exportStatus = _TranslationsSettingsStorageExportStatusRu._(_root);
	@override String get closeAppButton => 'Закрыть приложение!';
}

// Path: settings.about
class _TranslationsSettingsAboutRu implements TranslationsSettingsAboutEn {
	_TranslationsSettingsAboutRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'О приложении';
	@override late final _TranslationsSettingsAboutBlocksRu blocks = _TranslationsSettingsAboutBlocksRu._(_root);
}

// Path: stats.quickView
class _TranslationsStatsQuickViewRu implements TranslationsStatsQuickViewEn {
	_TranslationsStatsQuickViewRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Статистика';
	@override String get weeklyChart => 'Баллы по дням';
}

// Path: tags.creation
class _TranslationsTagsCreationRu implements TranslationsTagsCreationEn {
	_TranslationsTagsCreationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTagsCreationTitleRu title = _TranslationsTagsCreationTitleRu._(_root);
	@override late final _TranslationsTagsCreationFieldsRu fields = _TranslationsTagsCreationFieldsRu._(_root);
	@override String get submit => 'Сохранить';
	@override late final _TranslationsTagsCreationDeleteDialogRu deleteDialog = _TranslationsTagsCreationDeleteDialogRu._(_root);
	@override late final _TranslationsTagsCreationTooltipsRu tooltips = _TranslationsTagsCreationTooltipsRu._(_root);
}

// Path: tasks.list
class _TranslationsTasksListRu implements TranslationsTasksListEn {
	_TranslationsTasksListRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Задачи';
	@override String titleSelection({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: 'Выбрано ${n} задач',
		one: 'Выбрана ${n} задача',
		few: 'Выбрано ${n} задачи',
		many: 'Выбрано ${n} задач',
		other: 'Выбрано ${n} задач',
	);
	@override late final _TranslationsTasksListDeleteDialogRu deleteDialog = _TranslationsTasksListDeleteDialogRu._(_root);
	@override late final _TranslationsTasksListTooltipsRu tooltips = _TranslationsTasksListTooltipsRu._(_root);
	@override late final _TranslationsTasksListAppBarActionsRu appBarActions = _TranslationsTasksListAppBarActionsRu._(_root);
	@override String get cancelButton => 'Отменить задачи';
	@override String get canceledTaskMark => 'Отменена';
	@override String tasksLeftToComplete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: 'Нет невыполненных задач',
		one: 'Осталась ${n} задача',
		few: 'Осталось ${n} задачи',
		many: 'Осталось ${n} задач',
		other: 'Осталось ${n} задач',
	);
	@override late final _TranslationsTasksListEmptyRu empty = _TranslationsTasksListEmptyRu._(_root);
	@override late final _TranslationsTasksListPlanningRu planning = _TranslationsTasksListPlanningRu._(_root);
}

// Path: tasks.view
class _TranslationsTasksViewRu implements TranslationsTasksViewEn {
	_TranslationsTasksViewRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Просмотр задачи';
	@override late final _TranslationsTasksViewTooltipsRu tooltips = _TranslationsTasksViewTooltipsRu._(_root);
}

// Path: tasks.edit
class _TranslationsTasksEditRu implements TranslationsTasksEditEn {
	_TranslationsTasksEditRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTasksEditTitleRu title = _TranslationsTasksEditTitleRu._(_root);
	@override late final _TranslationsTasksEditFieldsRu fields = _TranslationsTasksEditFieldsRu._(_root);
	@override late final _TranslationsTasksEditSubmitRu submit = _TranslationsTasksEditSubmitRu._(_root);
	@override late final _TranslationsTasksEditDeleteDialogRu deleteDialog = _TranslationsTasksEditDeleteDialogRu._(_root);
	@override late final _TranslationsTasksEditTooltipsRu tooltips = _TranslationsTasksEditTooltipsRu._(_root);
}

// Path: habits.list.deleteDialog
class _TranslationsHabitsListDeleteDialogRu implements TranslationsHabitsListDeleteDialogEn {
	_TranslationsHabitsListDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String content({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'Вы уверены, что хотите удалить выбранную привычку?',
		few: 'Вы уверены, что хотите удалить ${n} выбранные привычки?',
		many: 'Вы уверены, что хотите удалить ${n} выбранных привычек?',
		other: 'Вы уверены, что хотите удалить ${n} выбранных привычек?',
	);
}

// Path: habits.list.tooltips
class _TranslationsHabitsListTooltipsRu implements TranslationsHabitsListTooltipsEn {
	_TranslationsHabitsListTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get addNewButton => 'Добавить привычку';
	@override String get viewHabitButton => 'Подробнее';
}

// Path: habits.list.empty
class _TranslationsHabitsListEmptyRu implements TranslationsHabitsListEmptyEn {
	_TranslationsHabitsListEmptyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get icon => '¯\\_(ツ)_/¯';
	@override String get title => 'Привычек нет';
	@override String get button => 'Создать новую';
}

// Path: habits.view.tooltips
class _TranslationsHabitsViewTooltipsRu implements TranslationsHabitsViewTooltipsEn {
	_TranslationsHabitsViewTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get editHabitButton => 'Редактировать';
}

// Path: habits.edit.title
class _TranslationsHabitsEditTitleRu implements TranslationsHabitsEditTitleEn {
	_TranslationsHabitsEditTitleRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get create => 'Новая привычка';
	@override String get existing => 'Редактировать привычку';
}

// Path: habits.edit.fields
class _TranslationsHabitsEditFieldsRu implements TranslationsHabitsEditFieldsEn {
	_TranslationsHabitsEditFieldsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get habitTitle => 'Название';
	@override String get habitDescription => 'Описание';
	@override String get habitRegularity => 'Регулярность (пока недоступно)';
	@override String get habitRegularityDaily => 'Ежедневно';
}

// Path: habits.edit.submit
class _TranslationsHabitsEditSubmitRu implements TranslationsHabitsEditSubmitEn {
	_TranslationsHabitsEditSubmitRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get create => 'Создать привычку!';
	@override String get existing => 'Сохранить изменения';
}

// Path: habits.edit.deleteDialog
class _TranslationsHabitsEditDeleteDialogRu implements TranslationsHabitsEditDeleteDialogEn {
	_TranslationsHabitsEditDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get content => 'Вы уверены, что хотите удалить эту привычку?';
}

// Path: habits.edit.tooltips
class _TranslationsHabitsEditTooltipsRu implements TranslationsHabitsEditTooltipsEn {
	_TranslationsHabitsEditTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteHabitButton => 'Удалить';
}

// Path: settings.list.blocks
class _TranslationsSettingsListBlocksRu implements TranslationsSettingsListBlocksEn {
	_TranslationsSettingsListBlocksRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get lookAndFeel => 'Внешний вид';
	@override String get storage => 'Хранилище';
	@override String get other => 'Другое';
}

// Path: settings.theme.useDynamicColorsOption
class _TranslationsSettingsThemeUseDynamicColorsOptionRu implements TranslationsSettingsThemeUseDynamicColorsOptionEn {
	_TranslationsSettingsThemeUseDynamicColorsOptionRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Использовать динамические цвета';
	@override String get subtitle => 'Тема приложения будет подстраиваться под системный акцентный цвет';
}

// Path: settings.theme.harmonizeColors
class _TranslationsSettingsThemeHarmonizeColorsRu implements TranslationsSettingsThemeHarmonizeColorsEn {
	_TranslationsSettingsThemeHarmonizeColorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Гармонизация цветов';
	@override String get subtitle => 'Пользовательские цвета будут лучше сочетаться с темой приложения';
}

// Path: settings.theme.values
class _TranslationsSettingsThemeValuesRu implements TranslationsSettingsThemeValuesEn {
	_TranslationsSettingsThemeValuesRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get light => 'Светлая тема';
	@override String get dark => 'Тёмная тема';
	@override String get system => 'Как в системе';
}

// Path: settings.storage.importStatus
class _TranslationsSettingsStorageImportStatusRu implements TranslationsSettingsStorageImportStatusEn {
	_TranslationsSettingsStorageImportStatusRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get process => 'Импорт данных...';
	@override String get successTitle => 'Требуется перезапуск';
	@override String get success => 'Вы успешно импортировали данные приложения!\nЧтобы завершить процесс, перезапустите приложение\n';
	@override String get failure => 'Что-то пошло не так. Данные не были импортированы :(\nПопробуйте выбрать другой файл\n';
}

// Path: settings.storage.exportStatus
class _TranslationsSettingsStorageExportStatusRu implements TranslationsSettingsStorageExportStatusEn {
	_TranslationsSettingsStorageExportStatusRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get process => 'Экспорт данных...';
	@override String get success => 'Вы успешно экспортировали данные!';
	@override String get failure => 'Что-то пошло не так. Данные не были экспортированы ;(\nПопробуйте перезапустить приложение\n';
}

// Path: settings.about.blocks
class _TranslationsSettingsAboutBlocksRu implements TranslationsSettingsAboutBlocksEn {
	_TranslationsSettingsAboutBlocksRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get version => 'Версия приложения';
	@override String get links => 'Ссылки';
	@override String get telegram => 'Telegram';
	@override String get repository => 'Исходный код';
	@override String get licenses => 'Лицензии';
}

// Path: tags.creation.title
class _TranslationsTagsCreationTitleRu implements TranslationsTagsCreationTitleEn {
	_TranslationsTagsCreationTitleRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get create => 'Новый тег';
	@override String get existing => 'Редактировать тег';
}

// Path: tags.creation.fields
class _TranslationsTagsCreationFieldsRu implements TranslationsTagsCreationFieldsEn {
	_TranslationsTagsCreationFieldsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get name => 'Название';
	@override String get color => 'Цвет тега';
}

// Path: tags.creation.deleteDialog
class _TranslationsTagsCreationDeleteDialogRu implements TranslationsTagsCreationDeleteDialogEn {
	_TranslationsTagsCreationDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get content => 'Вы уверены, что хотите удалить этот тег?\nВсе задачи с этим тегом тоже потеряют его\n';
}

// Path: tags.creation.tooltips
class _TranslationsTagsCreationTooltipsRu implements TranslationsTagsCreationTooltipsEn {
	_TranslationsTagsCreationTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteTagButton => 'Удалить';
}

// Path: tasks.list.deleteDialog
class _TranslationsTasksListDeleteDialogRu implements TranslationsTasksListDeleteDialogEn {
	_TranslationsTasksListDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String content({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'Вы уверены, что хотите удалить выбранную задачу?',
		few: 'Вы уверены, что хотите удалить ${n} выбранные задачи?',
		many: 'Вы уверены, что хотите удалить ${n} выбранных задач?',
		other: 'Вы уверены, что хотите удалить ${n} выбранных задач?',
	);
}

// Path: tasks.list.tooltips
class _TranslationsTasksListTooltipsRu implements TranslationsTasksListTooltipsEn {
	_TranslationsTasksListTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteSelectedButton => 'Удалить выбранные';
	@override String get selectAllButton => 'Выбрать все';
	@override String get removeSelectionButton => 'Снять выделение';
	@override String get addNewButton => 'Добавить задачу';
	@override String get canceledMarkButton => 'Возобновить';
	@override String get selectDateForSomedayTasksButton => 'Выбрать дату для задачи';
}

// Path: tasks.list.appBarActions
class _TranslationsTasksListAppBarActionsRu implements TranslationsTasksListAppBarActionsEn {
	_TranslationsTasksListAppBarActionsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTasksListAppBarActionsPopupMenuRu popupMenu = _TranslationsTasksListAppBarActionsPopupMenuRu._(_root);
}

// Path: tasks.list.empty
class _TranslationsTasksListEmptyRu implements TranslationsTasksListEmptyEn {
	_TranslationsTasksListEmptyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get icon => '¯\\_(ツ)_/¯';
	@override String get title => 'Задач нет';
	@override String get button => 'Создать новую';
	@override String get titleFilters => 'Нет задач с такими фильтрами';
	@override String get buttonFilters => 'Сбросить фильтры';
	@override String get buttonPlanning => 'Показать задачи на потом';
}

// Path: tasks.list.planning
class _TranslationsTasksListPlanningRu implements TranslationsTasksListPlanningEn {
	_TranslationsTasksListPlanningRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get labelWhenEnabled => 'Задачи на потом';
}

// Path: tasks.view.tooltips
class _TranslationsTasksViewTooltipsRu implements TranslationsTasksViewTooltipsEn {
	_TranslationsTasksViewTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get editTaskButton => 'Редактировать';
}

// Path: tasks.edit.title
class _TranslationsTasksEditTitleRu implements TranslationsTasksEditTitleEn {
	_TranslationsTasksEditTitleRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get create => 'Новая задача';
	@override String get existing => 'Редактировать задачу';
}

// Path: tasks.edit.fields
class _TranslationsTasksEditFieldsRu implements TranslationsTasksEditFieldsEn {
	_TranslationsTasksEditFieldsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get taskTitle => 'Название';
	@override String get taskDescription => 'Описание';
	@override String get taskForSomeday => 'На потом';
	@override String get taskPersistence => 'Сохранять задачу до выполнения';
}

// Path: tasks.edit.submit
class _TranslationsTasksEditSubmitRu implements TranslationsTasksEditSubmitEn {
	_TranslationsTasksEditSubmitRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get create => 'Создать задачу!';
	@override String get existing => 'Сохранить изменения';
}

// Path: tasks.edit.deleteDialog
class _TranslationsTasksEditDeleteDialogRu implements TranslationsTasksEditDeleteDialogEn {
	_TranslationsTasksEditDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get content => 'Вы уверены, что хотите удалить эту задачу?';
}

// Path: tasks.edit.tooltips
class _TranslationsTasksEditTooltipsRu implements TranslationsTasksEditTooltipsEn {
	_TranslationsTasksEditTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteTaskButton => 'Удалить';
}

// Path: tasks.list.appBarActions.popupMenu
class _TranslationsTasksListAppBarActionsPopupMenuRu implements TranslationsTasksListAppBarActionsPopupMenuEn {
	_TranslationsTasksListAppBarActionsPopupMenuRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get showCanceledOption => 'Показывать отменённые';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.dialog.confirmTitle' => 'Подтвердить?',
			'common.dialog.cancelButton' => 'Отмена',
			'common.dialog.okButton' => 'Да',
			'common.dialog.deleteTitle' => 'Подтвердить удаление',
			'common.dialog.deleteButton' => 'Удалить',
			'common.dialog.webSaveTitle' => 'Сохранить файл',
			'common.dialog.exitTitle' => 'Подтвердить выход',
			'common.dialog.exitContent' => 'Вы уверены, что хотите выйти со страницы? Все изменения будут потеряны!',
			'common.timeSubtitle.createdAt' => ({required Object time}) => 'создано ${time}',
			'common.timeSubtitle.modifiedAt' => ({required Object time}) => 'изменено ${time}',
			'common.timeSubtitle.completedAt' => ({required Object time}) => 'выполнено ${time}',
			'common.copy.defaultText' => 'Копировать текст',
			'common.copy.completedText' => 'Скопировано!',
			'common.timeOptions.today' => 'Сегодня',
			'common.timeOptions.yesterday' => 'Вчера',
			'common.timeOptions.tomorrow' => 'Завтра',
			'habits.list.title' => 'Привычки',
			'habits.list.titleSelection' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, zero: 'Выбрано ${n} привычек', one: 'Выбрана ${n} привычка', few: 'Выбрано ${n} привычки', many: 'Выбрано ${n} привычек', other: 'Выбрано ${n} привычек', ), 
			'habits.list.deleteDialog.content' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: 'Вы уверены, что хотите удалить выбранную привычку?', few: 'Вы уверены, что хотите удалить ${n} выбранные привычки?', many: 'Вы уверены, что хотите удалить ${n} выбранных привычек?', other: 'Вы уверены, что хотите удалить ${n} выбранных привычек?', ), 
			'habits.list.tooltips.addNewButton' => 'Добавить привычку',
			'habits.list.tooltips.viewHabitButton' => 'Подробнее',
			'habits.list.empty.icon' => '¯\\_(ツ)_/¯',
			'habits.list.empty.title' => 'Привычек нет',
			'habits.list.empty.button' => 'Создать новую',
			'habits.view.title' => 'Просмотр привычки',
			'habits.view.tooltips.editHabitButton' => 'Редактировать',
			'habits.edit.title.create' => 'Новая привычка',
			'habits.edit.title.existing' => 'Редактировать привычку',
			'habits.edit.fields.habitTitle' => 'Название',
			'habits.edit.fields.habitDescription' => 'Описание',
			'habits.edit.fields.habitRegularity' => 'Регулярность (пока недоступно)',
			'habits.edit.fields.habitRegularityDaily' => 'Ежедневно',
			'habits.edit.submit.create' => 'Создать привычку!',
			'habits.edit.submit.existing' => 'Сохранить изменения',
			'habits.edit.deleteDialog.content' => 'Вы уверены, что хотите удалить эту привычку?',
			'habits.edit.tooltips.deleteHabitButton' => 'Удалить',
			'settings.list.title' => 'Настройки',
			'settings.list.blocks.lookAndFeel' => 'Внешний вид',
			'settings.list.blocks.storage' => 'Хранилище',
			'settings.list.blocks.other' => 'Другое',
			'settings.theme.title' => 'Тема',
			'settings.theme.useDynamicColorsOption.title' => 'Использовать динамические цвета',
			'settings.theme.useDynamicColorsOption.subtitle' => 'Тема приложения будет подстраиваться под системный акцентный цвет',
			'settings.theme.harmonizeColors.title' => 'Гармонизация цветов',
			'settings.theme.harmonizeColors.subtitle' => 'Пользовательские цвета будут лучше сочетаться с темой приложения',
			'settings.theme.values.light' => 'Светлая тема',
			'settings.theme.values.dark' => 'Тёмная тема',
			'settings.theme.values.system' => 'Как в системе',
			'settings.specialEffects.title' => 'Спецэффекты',
			'settings.storage.title' => 'Резервное копирование данных (в разработке)',
			'settings.storage.aboutHeader' => 'Как это работает',
			'settings.storage.aboutContent' => 'Вы можете экспортировать все данные приложения в один JSON-файл и затем импортировать его в любой момент на любом устройстве.\n⚠️ Внимание: пока приложение на ранней стадии разработки, форматы данных могут меняться между версиями — из-за этого данные могут быть потеряны.\n',
			'settings.storage.importTitle' => 'Импорт',
			'settings.storage.exportTitle' => 'Экспорт',
			'settings.storage.importStatus.process' => 'Импорт данных...',
			'settings.storage.importStatus.successTitle' => 'Требуется перезапуск',
			'settings.storage.importStatus.success' => 'Вы успешно импортировали данные приложения!\nЧтобы завершить процесс, перезапустите приложение\n',
			'settings.storage.importStatus.failure' => 'Что-то пошло не так. Данные не были импортированы :(\nПопробуйте выбрать другой файл\n',
			'settings.storage.exportStatus.process' => 'Экспорт данных...',
			'settings.storage.exportStatus.success' => 'Вы успешно экспортировали данные!',
			'settings.storage.exportStatus.failure' => 'Что-то пошло не так. Данные не были экспортированы ;(\nПопробуйте перезапустить приложение\n',
			'settings.storage.closeAppButton' => 'Закрыть приложение!',
			'settings.about.title' => 'О приложении',
			'settings.about.blocks.version' => 'Версия приложения',
			'settings.about.blocks.links' => 'Ссылки',
			'settings.about.blocks.telegram' => 'Telegram',
			'settings.about.blocks.repository' => 'Исходный код',
			'settings.about.blocks.licenses' => 'Лицензии',
			'stats.quickView.title' => 'Статистика',
			'stats.quickView.weeklyChart' => 'Баллы по дням',
			'tags.creation.title.create' => 'Новый тег',
			'tags.creation.title.existing' => 'Редактировать тег',
			'tags.creation.fields.name' => 'Название',
			'tags.creation.fields.color' => 'Цвет тега',
			'tags.creation.submit' => 'Сохранить',
			'tags.creation.deleteDialog.content' => 'Вы уверены, что хотите удалить этот тег?\nВсе задачи с этим тегом тоже потеряют его\n',
			'tags.creation.tooltips.deleteTagButton' => 'Удалить',
			'tasks.list.title' => 'Задачи',
			'tasks.list.titleSelection' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, zero: 'Выбрано ${n} задач', one: 'Выбрана ${n} задача', few: 'Выбрано ${n} задачи', many: 'Выбрано ${n} задач', other: 'Выбрано ${n} задач', ), 
			'tasks.list.deleteDialog.content' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: 'Вы уверены, что хотите удалить выбранную задачу?', few: 'Вы уверены, что хотите удалить ${n} выбранные задачи?', many: 'Вы уверены, что хотите удалить ${n} выбранных задач?', other: 'Вы уверены, что хотите удалить ${n} выбранных задач?', ), 
			'tasks.list.tooltips.deleteSelectedButton' => 'Удалить выбранные',
			'tasks.list.tooltips.selectAllButton' => 'Выбрать все',
			'tasks.list.tooltips.removeSelectionButton' => 'Снять выделение',
			'tasks.list.tooltips.addNewButton' => 'Добавить задачу',
			'tasks.list.tooltips.canceledMarkButton' => 'Возобновить',
			'tasks.list.tooltips.selectDateForSomedayTasksButton' => 'Выбрать дату для задачи',
			'tasks.list.appBarActions.popupMenu.showCanceledOption' => 'Показывать отменённые',
			'tasks.list.cancelButton' => 'Отменить задачи',
			'tasks.list.canceledTaskMark' => 'Отменена',
			'tasks.list.tasksLeftToComplete' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, zero: 'Нет невыполненных задач', one: 'Осталась ${n} задача', few: 'Осталось ${n} задачи', many: 'Осталось ${n} задач', other: 'Осталось ${n} задач', ), 
			'tasks.list.empty.icon' => '¯\\_(ツ)_/¯',
			'tasks.list.empty.title' => 'Задач нет',
			'tasks.list.empty.button' => 'Создать новую',
			'tasks.list.empty.titleFilters' => 'Нет задач с такими фильтрами',
			'tasks.list.empty.buttonFilters' => 'Сбросить фильтры',
			'tasks.list.empty.buttonPlanning' => 'Показать задачи на потом',
			'tasks.list.planning.labelWhenEnabled' => 'Задачи на потом',
			'tasks.view.title' => 'Просмотр задачи',
			'tasks.view.tooltips.editTaskButton' => 'Редактировать',
			'tasks.edit.title.create' => 'Новая задача',
			'tasks.edit.title.existing' => 'Редактировать задачу',
			'tasks.edit.fields.taskTitle' => 'Название',
			'tasks.edit.fields.taskDescription' => 'Описание',
			'tasks.edit.fields.taskForSomeday' => 'На потом',
			'tasks.edit.fields.taskPersistence' => 'Сохранять задачу до выполнения',
			'tasks.edit.submit.create' => 'Создать задачу!',
			'tasks.edit.submit.existing' => 'Сохранить изменения',
			'tasks.edit.deleteDialog.content' => 'Вы уверены, что хотите удалить эту задачу?',
			'tasks.edit.tooltips.deleteTaskButton' => 'Удалить',
			_ => null,
		};
	}
}
