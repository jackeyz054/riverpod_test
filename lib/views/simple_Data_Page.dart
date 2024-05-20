import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/simple_Data_Provider.dart';

class SimpleDataPage extends ConsumerWidget {
  const SimpleDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchSimpleDataProvider = ref.watch(simpleDataNotifierProvider);
    final readSimpleDataProvider = ref.read(simpleDataNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDataPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "watch: $watchSimpleDataProvider",
            ),
            Text(
              "read: $readSimpleDataProvider",
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(simpleDataNotifierProvider.notifier)
                    .updateStateNumber(readSimpleDataProvider + 10);
              },
              child: const Text(
                "加10",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
