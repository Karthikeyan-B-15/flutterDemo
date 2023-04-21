import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo/widgets/counter.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (BuildContext context, value, Widget? child) {
        return Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  value.decrement();
                },
                child: const Text('Decrement'),
              ),
              Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                onPressed: () {
                  value.increment();
                },
                child: const Text('Increment'),
              )
            ],
          ),
        );
      },
    );
  }
}
