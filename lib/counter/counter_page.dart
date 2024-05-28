import 'package:flutter/material.dart';

import '../fibonnaci/fibonnaci_page.dart';
import 'counter_isolate.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    super.key,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  var isolate = CounterIsolate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FibonnaciPage(),
                  ),
                );
              },
              child: const Text('Fibonnaci page'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: isolate.portResultListener,
              initialData: 0,
              builder: (context, snapshot) {
                _counter = snapshot.data;
                return Text(
                  _counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => isolate.increment(_counter),
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => isolate.decrement(_counter),
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
