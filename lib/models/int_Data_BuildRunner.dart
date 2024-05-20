import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'int_Data_BuildRunner.g.dart';

@riverpod
class intDataNotifier extends _$intDataNotifier {
  @override
  int build() {
    return 0;
  }

  void updateData(int value) {
    state = value;
  }
}
