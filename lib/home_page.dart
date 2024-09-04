import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/counter_controller.dart';
import 'package:test/second_page.dart';
import 'package:test/storage/pref/pref.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final state = Get.put(CounterController());
  final pref = Preferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              const SizedBox(height: 24),
              Text(
                "${state.counter}",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: Colors.grey[700]),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () => pref.saveCounter(state.counter),
                child: const Text(
                  'Save connter',
                ),
              ),
              const SizedBox(height: 64),
              GestureDetector(
                onTap: () => Get.to(() => SecondPage()),
                child: const Text(
                  'Watch next screen!',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => state.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
