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
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Turning The Page',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                ElevatedButton(
                  child: Text('Write A Dairy'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WriteADiaryRoute(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(30),
                    ),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 30),
                    ),
                  ),
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
