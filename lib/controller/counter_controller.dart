import 'package:get/get.dart';
import 'package:test/storage/pref/pref.dart';

class CounterController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    int data = await Preferences().getCounter();
    _counter = data.obs;
  }

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
