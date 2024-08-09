enum TaskImportance {
  notImportant,
  normal,
  important;

  factory TaskImportance.fromIndex(int? index) {
    switch (index) {
      case 0:
        return TaskImportance.notImportant;
      case 1:
        return TaskImportance.normal;
      case 2:
        return TaskImportance.important;
      default:
        return TaskImportance.normal;
    }
  }
}
