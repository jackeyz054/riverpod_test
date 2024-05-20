import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/mutiple_Data_Provider_buildRunner.dart';

class MultipleDataBuildRunnerPage extends ConsumerWidget {
  const MultipleDataBuildRunnerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchMultipleDataProvider = ref.watch(userStateNotifierProvider);
    final readMultipleDataProvider = ref.read(userStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDataPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "watch ID: ${watchMultipleDataProvider.iD}",
            ),
            Text(
              "watch age: ${watchMultipleDataProvider.age}",
            ),
            Text(
              "watch name: ${watchMultipleDataProvider.name}",
            ),
            const SizedBox(height: 20),
            Text(
              "read ID: ${readMultipleDataProvider.iD}",
            ),
            Text(
              "read age: ${readMultipleDataProvider.age}",
            ),
            Text(
              "read name: ${readMultipleDataProvider.name}",
            ),
            ElevatedButton(
              onPressed: () {
                // 逐個更新狀態
                ref.read(userStateNotifierProvider.notifier).updateID(20);
                ref.read(userStateNotifierProvider.notifier).updateAge(25);
                ref.read(userStateNotifierProvider.notifier).updateName("JIM");
              },
              child: const Text('逐個更新資料'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(userStateNotifierProvider.notifier).updateAll(
                      iD: 1,
                      age: 30,
                      name: 'Tom',
                    );
              },
              child: const Text(
                "更新資料",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
