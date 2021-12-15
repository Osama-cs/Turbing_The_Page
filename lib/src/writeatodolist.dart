import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class WriteATodoList extends StatefulWidget {
  const WriteATodoList({Key? key}) : super(key: key);

  @override
  _WriteATodoListState createState() => _WriteATodoListState();
}

class _WriteATodoListState extends State<WriteATodoList> {
  final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'what did you do today...',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            hintText:
                                'what time should you start the activity?',
                            suffixIcon: Icon(Icons.event_note),
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          mode: DateTimeFieldPickerMode.dateAndTime,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter a date';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            hintText:
                                'what time should you get this activity done?',
                            suffixIcon: Icon(Icons.event_note),
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          mode: DateTimeFieldPickerMode.dateAndTime,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter a date';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your title';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'what are you planning to do?',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                            // border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (_formKey3.currentState!.validate()) {
                      //       // ScaffoldMessenger.of(context).showSnackBar(
                      //       //     const SnackBar(content: Text('Logging In')),
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const HomePage()),
                      //       );
                      //     }
                      //   },
                      //   child: const Text('Submit'),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
