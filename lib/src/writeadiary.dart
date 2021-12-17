import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:individualproject/db/database_provider.dart';
import 'package:individualproject/src/homepage.dart';

class WriteADiary extends StatefulWidget {
  const WriteADiary({Key? key}) : super(key: key);

  @override
  _WriteADiaryState createState() => _WriteADiaryState();
}

class _WriteADiaryState extends State<WriteADiary> {
  final _formKey2 = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
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
                  key: _formKey2,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _timeController,
                            decoration: const InputDecoration(
                              labelText: "what is the date you want to enter",
                              hintText: "date",
                              // suffixIcon: Icon(Icons.event_note),
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context).requestFocus(FocusNode());

                              date = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100)))!;

                              _timeController.text = date.toIso8601String();
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _titleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your title';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'title',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                            // border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _descriptionController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some info about today';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "let's talk about you",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                            // border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      _isProcessing
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey2.currentState!.validate()) {
                                  final String diaryTime =
                                      _timeController.text.trim();
                                  final String diaryTitle =
                                      _titleController.text.trim();
                                  final String diaryDescription =
                                      _descriptionController.text.trim();
                                  User? user =
                                      FirebaseAuth.instance.currentUser;

                                  await FirebaseFirestore.instance
                                      .collection("diaries")
                                      .add({
                                    'uid': user!.uid,
                                    'diaryTime': diaryTime,
                                    'diaryTitle': diaryTitle,
                                    'diaryDescription': diaryDescription,
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

// hintText: 'date',
// suffixIcon: Icon(Icons.event_note),
// hintStyle: TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w600,
//   color: Colors.grey,
// ),
