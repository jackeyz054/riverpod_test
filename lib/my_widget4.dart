import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/s4.dart';

class MyWidget4Page extends ConsumerWidget {
  const MyWidget4Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s4 = ref.watch(s4NotifierProvider);

    final widget = s4.when(
      loading: () => const Text('準備中..'),
      error: (e, s) => Text('錯誤:$e,error code:$s'),
      data: (data) => Text(data),
    );

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(s4NotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Text('點擊'),
    );

    Widget baseWidgt(Widget body) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('MyWidget2Page'),
        ),
        body: body,
      );
    }

    return baseWidgt(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            const SizedBox(height: 25),
            button,
          ],
        ),
      ),
    );
  }
}
