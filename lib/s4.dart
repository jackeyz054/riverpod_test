import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 's4.g.dart';

@riverpod
class S4Notifier extends _$S4Notifier {
  @override
  Stream<String> build() {
    // 每秒傳遞訊息 stream
    final controller = StreamController<String>();
    const sec1 = Duration(milliseconds: 1);
    final timer = Timer.periodic(sec1, (t) {
      controller.add('收到了${t.tick}則訊息');
    });
    // 4秒後にストップ
    const sec4 = Duration(seconds: 4);
    Future.delayed(sec4, () {
      timer.cancel();
      controller.sink.close();
    });
    return controller.stream;
  }

  // データを変更する関数
  void updateState() async {
    // 1秒まつ
    const sec1 = Duration(seconds: 1);
    await Future.delayed(sec1);
    // データを上書き
    state = const AsyncValue.data('收到了55則訊息');
    // 1秒まつ
    await Future.delayed(sec1);
    // データを上書き
    state = const AsyncValue.data('收到了99則訊息');
  }
}