extension InsertSeparatorsListExt<T> on List<T> {
  List<T> insertSeparators(T separator) =>
      expand((e) => [e, separator]).toList()..removeLast();
}
