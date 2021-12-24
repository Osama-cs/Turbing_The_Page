import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WriteATodoList extends StatefulWidget {
  const WriteATodoList({Key? key}) : super(key: key);

  @override
  _WriteATodoListState createState() => _WriteATodoListState();
}

class _WriteATodoListState extends State<WriteATodoList> {
  final _formKey3 = GlobalKey<FormState>();

  final TextEditingController _startOfActivityController =
      TextEditingController();
  final TextEditingController _endOfActivityController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
                        child: TextFormField(
                          controller: _startOfActivityController,
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
                          onTap: () async {
                            TimeOfDay time =
                                const TimeOfDay(hour: 12, minute: 50);

                            time = (await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now()))!;
                            _startOfActivityController.text =
                                time.format(context).toString();
                          },
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
                          controller: _endOfActivityController,
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
                          onTap: () async {
                            TimeOfDay time =
                                const TimeOfDay(hour: 12, minute: 50);

                            time = (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ))!;
                            _endOfActivityController.text =
                                time.format(context).toString();
                          },
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
                          controller: _descriptionController,
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
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey3.currentState!.validate()) {
                            final String todoStartOfActivity =
                                _startOfActivityController.text.trim();
                            final String todoEndOfActivity =
                                _endOfActivityController.text.trim();
                            final String todoDescription =
                                _descriptionController.text.trim();
                            final String date = formatDate(
                                DateTime.now(), [yyyy, '-', mm, '-', dd]);

                            User? user = FirebaseAuth.instance.currentUser;

                            await FirebaseFirestore.instance
                                .collection("todoLists")
                                .add({
                              'uid': user!.uid,
                              'todoStart': todoStartOfActivity,
                              'todoEnd': todoEndOfActivity,
                              'todoDescription': todoDescription,
                              'date': date,
                            });

                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Submit'),
                      ),
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
