import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelplinesPage extends StatefulWidget {
  const HelplinesPage({Key? key}) : super(key: key);

  @override
  _HelplinesPageState createState() => _HelplinesPageState();
}

class _HelplinesPageState extends State<HelplinesPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          title: const Text(
            "Mental Health Helplines",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Here are some mental health helplines that you can call if you ever feel down about yourself and need some extra help.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: ["", "hi"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                bulletColor: Colors.black,
                listOrder: ListOrder.ordered,
              )
            ],
          ),
        ),
      ),
    );
  }
}
