import 'package:flutter/material.dart';

import 'writeadiary.dart';

void main() {
  runApp(const DiaryEntries());
}

class DiaryEntries extends StatelessWidget {
  const DiaryEntries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WriteADiary(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
      ),
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Turning The Page 1',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
