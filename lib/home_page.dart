import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/counter_controller.dart';
import 'package:test/second_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final state = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
        init: state,
        builder: (counter) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
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
                    onTap: () => Get.to(() => SecondPage()),
                    child: const Text(
                      'Watch next screen!',
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async => counter.incrementCounter(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
