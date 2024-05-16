import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's1.g.dart';

@riverpod
class S1Notifier extends _$S1Notifier {
  @override
  int build() {
    return 0;
  }

  void updateState() {
    final oldState = state;
    final newState = oldState + 1;
    state = newState;
  }
}
