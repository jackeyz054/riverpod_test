import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'List_Data_BuildRunner.g.dart';

@riverpod
class ListDataNotifier extends _$ListDataNotifier {
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
