import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _diariesStream = FirebaseFirestore.instance
        .collection('diaries')
        .where('uid', isEqualTo: user!.uid)
        .snapshots(includeMetadataChanges: true);
    return MaterialApp(
      home: Scaffold(
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
            child: StreamBuilder<QuerySnapshot>(
              stream: _diariesStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading...");
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()!;
                    return ListTile(
                      title: Text(data['diaryTime']),
                      subtitle: Text(data['diaryTitle']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
