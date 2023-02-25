import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';

@injectable
class TagSelectionCubit extends Cubit<List<ItemTag>> {
  TagSelectionCubit(this._repository) : super([]);

  final TagsRepository _repository;
}
