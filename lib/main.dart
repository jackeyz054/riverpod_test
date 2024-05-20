import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_buildrunner/my_widget1.dart';
import 'package:riverpod_test_buildrunner/my_widget2.dart';
import 'package:riverpod_test_buildrunner/my_widget3.dart';
import 'package:riverpod_test_buildrunner/my_widget4.dart';
import 'package:riverpod_test_buildrunner/views/List_Data_BuildRunner_Page.dart';
import 'package:riverpod_test_buildrunner/views/future_Data_BuildRunner_Page.dart';
import 'package:riverpod_test_buildrunner/views/int_Data_BuildRunner_Page.dart';
import 'package:riverpod_test_buildrunner/views/multiple_Data_Page.dart';
import 'package:riverpod_test_buildrunner/views/mutiple_Data_BuildRunner_Page.dart';
import 'package:riverpod_test_buildrunner/views/simple_Data_BuildRunner_Page.dart';
import 'package:riverpod_test_buildrunner/views/simple_Data_Page.dart';
import 'package:riverpod_test_buildrunner/views/steam_Data_BuildRunner_page.dart';

void main() {
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverpodTestPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleDataPage(),
                ),
              ),
              child: const Text('SimpleDataPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleDataBuildRunnerPage(),
                ),
              ),
              child: const Text('SimpleDataBuildRunnerPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MultipleDataPage(),
                ),
              ),
              child: const Text('MultipleDataPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MultipleDataBuildRunnerPage(),
                ),
              ),
              child: const Text('MultipleDataBuildRunnerPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntDataPage(),
                ),
              ),
              child: const Text('IntDataPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListDataPage(),
                ),
              ),
              child: const Text('ListDataPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FutureDataPage(),
                ),
              ),
              child: const Text('FutureDataPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SteamDataPage(),
                ),
              ),
              child: const Text('SteamDataPage'),
            ),
          ],
        ),
      ),
    );
  }
}
