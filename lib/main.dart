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
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Turing The Page',
                  style: TextStyle(),
                ),
                ElevatedButton(
                  child: const Text('Write A Dairy'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WriteADiaryRoute()));
                  },
                ),
                ElevatedButton(
                  child: const Text('To-do List'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WriteADiaryRoute()));
                  },
                ),
                ElevatedButton(
                  child: const Text('Calender'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WriteADiaryRoute()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: const Text('Open route'),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const WriteADiaryRoute()),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
