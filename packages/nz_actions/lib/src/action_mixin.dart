/// Base for all actions.
/// Has enum type that helps differentiate them.
mixin ActionMixin<T extends Enum> {
  /// Type of the action.
  T get type;
}
