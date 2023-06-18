abstract class UserRepository {
  /// Setup user name
  Future<void> setName({
    required String name,
  });

  /// Get user name
  Future<String> getName();
}
