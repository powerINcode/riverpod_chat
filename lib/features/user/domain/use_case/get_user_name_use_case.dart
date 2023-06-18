import 'package:idt_chat/features/user/domain/repository/user_repository.dart';

class GetUserNameUseCase {
  final UserRepository _userRepository;

  const GetUserNameUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<String> call() {
    return _userRepository.getName();
  }
}
