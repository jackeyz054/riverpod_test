import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/steam_Data_BuilderRunner.dart';

class SteamDataPage extends ConsumerWidget {
  const SteamDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s4 = ref.watch(steamDataNotifierProvider);

    final widget = s4.when(
      loading: () => const Text('準備中..'),
      error: (e, s) => Text('錯誤:$e,error code:$s'),
      data: (data) => Text(data),
    );

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(steamDataNotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Text('點擊'),
    );

    Widget baseWidgt(Widget body) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('SteamDataPage'),
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
