import 'package:flutter/material.dart';

import 'writeadiary.dart';

void main() {
  runApp(const DiaryEntries());
}

class DiaryEntries extends StatefulWidget {
  const DiaryEntries({Key? key}) : super(key: key);

  @override
  _DiaryEntriesState createState() => _DiaryEntriesState();
}

class _DiaryEntriesState extends State<DiaryEntries> {
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
            children: const <Widget>[
              Text(
                'Turning The Page 2',
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
