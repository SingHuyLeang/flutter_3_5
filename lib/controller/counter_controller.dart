import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt _counter = 0.obs;
  // get _counter
  int get counter => _counter.value;

  // increment counter
  void incrementCounter() async {
    _counter.value++;
    update();
  }

  // decrement counter
  void decrementCounter() async {
    _counter.value--;
    update();
  }
}
