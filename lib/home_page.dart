import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final visible = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Obx(
        () => Visibility(
          visible: visible.value,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 32),
                // form
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text("0", style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 24),
                      // field
                      SizedBox(
                        width: 230,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Add a task",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      // button save
                      const SizedBox(width: 24),
                      SizedBox(
                        width: 80,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // tasks
                const SizedBox(height: 32),
                ...List.generate(
                  10,
                  (index) => Container(
                    width: double.infinity,
                    height: 64,
                    color: Colors.amber,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
