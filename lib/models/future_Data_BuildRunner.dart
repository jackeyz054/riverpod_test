import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'future_Data_BuildRunner.g.dart';

@riverpod
class FutureDataNotifier extends _$FutureDataNotifier {
  @override
  Future<String> build() async {
    // 等待3秒
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // 第一次等待完成
    return '基本的等待完成';
  }

  // build_runner可改變方法
  void updateState() async {
    // 使用AsyncValue進行Future系列的進行，await之類的
    state = const AsyncValue.loading();
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // 更新目標state
    state = const AsyncValue.data('新的等待完成');
  }
}