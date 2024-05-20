import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/models/List_Data_BuildRunner.dart';

class ListDataPage extends ConsumerWidget {
  const ListDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s2 = ref.watch(listDataNotifierProvider);

    ref.listen(listDataNotifierProvider, (previous, next) {
      final s2_List = ref.watch(listDataNotifierProvider);

      debugPrint("$s2_List");
    });

    final listView = ListView.builder(
      itemCount: s2.length,
      itemBuilder: (_, index) {
        final text = Text(s2[index]);
        return Card(child: text);
      },
    );

    final button = FloatingActionButton(
      onPressed: () {
        final notifier = ref.read(listDataNotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Icon(Icons.add),
    );

    Widget baseWidgt(Widget body) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ListDataPage'),
        ),
        body: body,
        floatingActionButton: button,
      );
    }

    return baseWidgt(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: listView,
      ),
    );
  }
}
