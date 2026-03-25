import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 79, 19, 107),
        ),
      ),
      home: const MyHomePage(title: 'Инкремент'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void incrementClear() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Значение инкремента:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                  backgroundColor: const Color.fromARGB(255, 209, 61, 31),
                ),
                FloatingActionButton(
                  onPressed: incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                  backgroundColor: const Color.fromARGB(255, 153, 175, 76),
                ),
              ],
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 78, 62, 221),
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.pressed)
                      ? Colors.grey.shade200
                      : null,
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(0, 110, 198, 241),
                ),
              ),
              onPressed: incrementClear,
              child: Text('Сбросить'),
            ),
          ],
        ),
      ),
    );
  }
}
