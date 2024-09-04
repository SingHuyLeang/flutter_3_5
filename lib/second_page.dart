import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/counter_controller.dart';

import 'storage/pref/pref.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final state = Get.find<CounterController>();
  final pref = Preferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
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
                  'Save counter',
                ),
              ),
              const SizedBox(height: 64),
              GestureDetector(
                onTap: () => Get.back(),
                child: const Text(
                  'Watch back screen!',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => state.decrementCounter(),
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
