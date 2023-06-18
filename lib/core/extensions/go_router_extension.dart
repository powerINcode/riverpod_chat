import 'package:go_router/go_router.dart';
import 'package:idt_chat/core/navigation/navigation_config.dart';

extension GoRouterExt on GoRouter {
  Future<T?> pushConfg<T>(String name, NavigationConfig config) {
    return pushNamed(
      name,
      extra: config,
    );
  }
}
