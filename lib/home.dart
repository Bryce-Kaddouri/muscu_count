import 'package:compteur_exos/counter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  Map<String, dynamic> _data = {
    'exercices': [
      {
        'name': 'Pompes',
        'icon': 'https://img.icons8.com/color/200/pushups--v1.png',
      },
      {
        'name': 'Squats',
        'icon': 'https://img.icons8.com/external-flaticons-flat-flat-icons/200/external-squat-fitness-and-healthy-living-flaticons-flat-flat-icons.png',
      },
      {
        'name': 'Abdos',
        'icon': 'https://img.icons8.com/color/200/sit-ups.png',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Compteur d\'exercices'),
      ),
      body: ListView.builder(
        itemCount: _data['exercices'].length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(_data['exercices'][index]['icon'],
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const CircularProgressIndicator();
              },
              frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  child: child,
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },

            ),
            title: Text(_data['exercices'][index]['name']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CounterScreen(
                  exercice: _data['exercices'][index],
                );
              }));
            },
          );
        },
      ),
    );
  }
}
