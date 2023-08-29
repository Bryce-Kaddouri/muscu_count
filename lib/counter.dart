import 'package:flutter/material.dart';
// import sensor
import 'package:sensors_plus/sensors_plus.dart';

class CounterScreen extends StatefulWidget {
  final Map<String, dynamic> exercice;
   CounterScreen({super.key, required this.exercice});

  @override
  State<CounterScreen> createState() => _CounterScreenState();

}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // listen to sensor
   
    accelerometerEvents.listen(
          (AccelerometerEvent event) {
        print(event);
      },
      onError: (error) {
            print(error);
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Compteur d\'exercices'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.exercice['icon'], height: 100, width: 100),
            Text(widget.exercice['name']),
            const SizedBox(height: 20),
            Text('$_counter'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}
