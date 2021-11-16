import 'package:flutter/material.dart';

void main() {
  runApp(const WriteATodo());
}

class WriteATodo extends StatelessWidget {
  const WriteATodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('todo'),
        ),
      ),
    );
  }
}
