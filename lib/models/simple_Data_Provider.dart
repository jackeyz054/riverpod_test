import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleDataProvider extends StateNotifier<int> {
  SimpleDataProvider() : super(10);

  void updateStateNumber(int value) {
    state = value;
  }
}

final simpleDataNotifierProvider =
    StateNotifierProvider<SimpleDataProvider, int>((ref) {
  return SimpleDataProvider();
});
