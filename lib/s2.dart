import 'package:riverpod_annotation/riverpod_annotation.dart';
part 's2.g.dart';

@riverpod
class S2Notifier extends _$S2Notifier {
  @override
  List<String> build() {
    return ['A', 'B', 'C', 'D'];
  }

  void updateState() {
    final oldState = state;
    final newState = [...oldState, 'X'];
    state = newState;
  }
}
