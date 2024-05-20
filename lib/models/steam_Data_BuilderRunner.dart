import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'steam_Data_BuilderRunner.g.dart';

@riverpod
class SteamDataNotifier extends _$SteamDataNotifier {
  @override
  Stream<String> build() {
    // 每秒傳遞訊息 stream
    final controller = StreamController<String>();
    const sec1 = Duration(milliseconds: 1);
    final timer = Timer.periodic(sec1, (t) {
      controller.add('收到了${t.tick}則訊息');
    });
    // 等待4秒鐘
    const sec4 = Duration(seconds: 4);
    Future.delayed(sec4, () {
      timer.cancel();
      controller.sink.close();
    });
    return controller.stream;
  }

  // 重新開啟Steam
  void updateState() async {
    // 等待一秒
    const sec1 = Duration(seconds: 1);
    await Future.delayed(sec1);
    // 等完一秒後直接給資料
    state = const AsyncValue.data('收到了55則訊息');
    // 等待一秒
    await Future.delayed(sec1);
    // 等完一秒後直接給資料
    state = const AsyncValue.data('收到了99則訊息');
  }
}