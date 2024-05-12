import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterView extends HookWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final counter = useState<int>(0);
    // useState creates a ValueNotifier and subscribes to ir which means it will
    // rebuild the widget when it changes
    final numbers = useState<List<int>>([]);
    // final names = useState<Map<String, String>>({});
    // useValueNotifier doesn't subscribe to the ValueNotifier so it wont rebuild
    // the page when it changes it will rebuild only the ValueNotifierBuilder that
    // uses this hook to build a widget
    final counter = useValueNotifier(0);
    // the following notification will not rebuild all the interface, only the appbar
    print('Building the Widget');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          // a change in value will only rebuild this widget
          child: ValueListenableBuilder(
            valueListenable: counter,
            builder: (_, value, __) {
              print('building the ValueListenableBuilder');
              return Text('Counter $value');
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // names.value = {...names.value, 'flutter': '3.x'};
              counter.value++;
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
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
          // a change in numbers value will rebuild the entire page
          numbers.value = [...numbers.value, numbers.value.length + 1];
          // counter.value++;
        },
      ),
    );
  }
}
