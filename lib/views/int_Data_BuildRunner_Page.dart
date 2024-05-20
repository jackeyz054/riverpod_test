import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/int_Data_BuildRunner.dart';

class IntDataPage extends ConsumerStatefulWidget {
  const IntDataPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntDataPageState();
}

class _IntDataPageState extends ConsumerState<IntDataPage> {
  @override
  Widget build(BuildContext context) {
    final s1 = ref.watch(intDataNotifierProvider);

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(intDataNotifierProvider.notifier);

        notifier.updateData(ref.read(intDataNotifierProvider) + 10);
      },
      child: const Text('點擊'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("IntDataPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$s1'),
            const SizedBox(height: 10),
            button,
          ],
        ),
      ),
    );
  }
}
