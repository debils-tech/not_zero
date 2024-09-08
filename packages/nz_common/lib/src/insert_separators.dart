extension IterableSeparator<T> on Iterable<T> {
  Iterable<T> separateWith(T divider) sync* {
    final originalIterator = iterator..moveNext();
    for (var i = 0; i < length; i++) {
      yield originalIterator.current;
      if (originalIterator.moveNext()) yield divider;
    }
  }

  List<T> listSeparate(T divider) =>
      separateWith(divider).toList(growable: false);
}
