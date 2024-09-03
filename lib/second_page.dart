import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/counter_controller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final state = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      init: state,
      builder: (counter) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Second Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(height: 24),
                Text(
                  "${counter.counter}",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .apply(color: Colors.grey[700]),
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text(
                    'Watch back screen!',
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => counter.decrementCounter(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        );
      },
    );
  }
}
