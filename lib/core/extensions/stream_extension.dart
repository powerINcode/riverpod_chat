import 'package:rxdart/rxdart.dart';

extension StremExt<T> on Stream<T> {
  void subscribeIn(
    CompositeSubscription composition, {
    void Function(T event)? onData,
    void Function()? onDone,
    void Function(Object error)? onError,
  }) {
    composition.add(
      listen(onData, onError: onError, onDone: onDone),
    );
  }
}
