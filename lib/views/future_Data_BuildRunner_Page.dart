import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/s3.dart';

class FutureDataPage extends ConsumerWidget {
  const FutureDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s3 = ref.watch(s3NotifierProvider);

    final widget = s3.when(
      loading: () => const Text('準備中..'),
      error: (e, s) => Text('錯誤:$e,error code:$s'),
      data: (data) => Text(data),
    );

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(s3NotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Text('點擊'),
    );

    Widget baseWidgt(Widget body) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('FutureDataPage'),
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
