import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/simple_Data_Provider_buildRunner.dart';

class SimpleDataBuildRunnerPage extends ConsumerWidget {
  const SimpleDataBuildRunnerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchSimpleDataProvider = ref.watch(simpleDataBuildRunnerProvider);
    final readSimpleDataProvider = ref.read(simpleDataBuildRunnerProvider);

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
                    .read(simpleDataBuildRunnerProvider.notifier)
                    .updateState(readSimpleDataProvider + 10);
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
