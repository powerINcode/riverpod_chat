import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/user/data/repository/user_repository_impl.dart';
import 'package:idt_chat/features/user/domain/repository/user_repository.dart';
import 'package:idt_chat/features/user/domain/use_case/get_user_name_use_case.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepositoryImpl());

final getUserNameUseCase = Provider((ref) {
  final repository = ref.watch(userRepositoryProvider);

  return GetUserNameUseCase(userRepository: repository);
});
