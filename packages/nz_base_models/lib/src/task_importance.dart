enum TaskImportance {
  notImportant,
  normal,
  important
  ;

  factory TaskImportance.fromIndex(int? index) => switch (index) {
    0 => .notImportant,
    1 => .normal,
    2 => .important,
    _ => .normal,
  };
}
