import 'package:flutter/material.dart';
import 'package:individualproject/src/writeatodolist.dart';

void main() {
  runApp(const TodoEntries());
}

class TodoEntries extends StatelessWidget {
  const TodoEntries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WriteATodoList(),
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
