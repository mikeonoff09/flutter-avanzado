import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterView extends HookWidget {
  const CounterView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '${counter.value}',
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counter.value++;
        },
      ),
    );
  }

}
