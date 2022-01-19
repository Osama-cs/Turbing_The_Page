import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:individualproject/src/settingspage.dart';

import 'gpnearme.dart';
import 'helplinespage.dart';
import 'writeadiary.dart';

void main() {
  runApp(const DiaryEntries());
}

class DiaryEntries extends StatefulWidget {
  const DiaryEntries({Key? key}) : super(key: key);

  @override
  _DiaryEntriesState createState() => _DiaryEntriesState();
}

//This is where the diary entries from firebase gets displayed.
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
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
        ),
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          title: const Text(
            "Write A diary",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade100,
                ),
                child: const Text(
                  "Turning The Page",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Counselors/doctors near you'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GPNearMePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline_rounded),
                title: const Text('Mental Health Helplines'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelplinesPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: SafeArea(
          child: Center(
            //This Stream builder is how the data gets displayed onto the page from firebase firestore.
            child: StreamBuilder<QuerySnapshot>(
              stream: _diariesStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong :(");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()!;
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const Icon(Icons.note),
                        title: Text(data['diaryTime']),
                        subtitle: Text(data['diaryTitle']),
                        isThreeLine: true,
                        tileColor: Colors.lightBlueAccent.shade100,
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(data['diaryTitle']),
                            content: Text(data['diaryDescription']),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        ),
                      ),
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
