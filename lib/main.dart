import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(primarySwatch: Colors.blue),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;
  Color _numberColor = Colors.blue;

  void _increaseCounter(int value) {
    setState(() {
      _counter = value;
      if (_counter < 0) {
        _counter = 0;
      } else if (_counter > 100) {
        _counter = 100;
      }

      if (_counter == 0) {
        _numberColor = Colors.red;
      } else if (_counter >= 50) {
        _numberColor = Colors.green;
      } else {
        _numberColor = Colors.orange;
      }
      if (_counter == 100) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('🚀 Lift Off!'),
            content: const Text(
              'The rocket has launched successfully!\n\n🎉 Mission Accomplished 🎉',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch Controller')),
      //set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: _numberColor,
              child: Text(
                //to displays current number
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              _increaseCounter(value.toInt());
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _increaseCounter(_counter - 1);
                },
                child: const Text('Abort'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                ),
                onPressed: () {
                  _increaseCounter(0);
                },
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () {
                  _increaseCounter(_counter + 1);
                },
                child: const Text('Ignite'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
