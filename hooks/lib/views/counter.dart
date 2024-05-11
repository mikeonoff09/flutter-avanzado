import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterView extends HookWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);
    final numbers = useState<List<int>>([]);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: numbers.value.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(numbers.value[index].toString()),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          numbers.value = [...numbers.value, numbers.value.length + 1];
          // counter.value++;
        },
      ),
    );
  }
}
