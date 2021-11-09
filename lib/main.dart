import 'package:flutter/material.dart';
import 'writeadiary.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Turing the Page',
    home: HomeRoute(),
  ));
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WriteADiaryRoute()),
            );
          },
        ),
      ),
    );
  }
}
