import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/multiple_Data_Provider.dart';

class MultipleDataPage extends ConsumerWidget {
  const MultipleDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchMultipleDataProvider = ref.watch(userNotifierProvider);
    final readMultipleDataProvider = ref.read(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDataPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "watch ID: ${watchMultipleDataProvider.ID}",
            ),
            Text(
              "watch age: ${watchMultipleDataProvider.age}",
            ),
            Text(
              "watch name: ${watchMultipleDataProvider.name}",
            ),
            Text(
              "read ID: ${readMultipleDataProvider.ID}",
            ),
            Text(
              "read age: ${readMultipleDataProvider.age}",
            ),
            Text(
              "read name: ${readMultipleDataProvider.name}",
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(userNotifierProvider.notifier).updateID(20);
                ref.read(userNotifierProvider.notifier).updateAge(25);
                ref.read(userNotifierProvider.notifier).updateName("JIM");
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
