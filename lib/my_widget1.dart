import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/s1.dart';

class MyWidget1 extends ConsumerStatefulWidget {
  const MyWidget1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyWidget1State();
}


class _MyWidget1State extends ConsumerState<MyWidget1> {
  void showFinishDialog(int s1) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("當前數字"),
          content: Text("目前s1.state為:$s1"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('確定'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final s1 = ref.watch(s1NotifierProvider);

    ref.listen(s1NotifierProvider, (previous, next) {
      final s1Value = ref.watch(s1NotifierProvider);
      debugPrint(s1Value.toString());
      // if (s1Value == 3) {
      //   showFinishDialog(s1Value);
      // }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('我從$previous變成了$next'),
        ),
      );
    });

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(s1NotifierProvider.notifier);

        notifier.updateState();
      },
      child: const Text('點擊'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("widget1_Page"),
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
