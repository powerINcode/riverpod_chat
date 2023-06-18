import 'package:idt_chat/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  String _name = 'Guest';

  @override
  Future<String> getName() async {
    return _name;
  }

  @override
  Future<void> setName({required String name}) async {
    _name = name;
  }
}
