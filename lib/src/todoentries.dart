import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:individualproject/src/writeatodolist.dart';

class TodoEntries extends StatefulWidget {
  const TodoEntries({Key? key}) : super(key: key);

  @override
  _TodoEntriesState createState() => _TodoEntriesState();
}

class _TodoEntriesState extends State<TodoEntries> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _todoStream = FirebaseFirestore.instance
        .collection('todoLists')
        .where('uid', isEqualTo: user!.uid)
        .snapshots(includeMetadataChanges: true);
    return MaterialApp(
      home: Scaffold(
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
          title: const Text("Write A todo list"),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: SafeArea(
          child: Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: _todoStream,
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
                    return Column(
                      children: [
                        Text(data['todoStart']),
                        Card(
                          elevation: 5,
                          child: ListTile(
                            leading: const Icon(Icons.list),
                            title: Text(data['todoDescription']),
                            onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("what would you like to do?"),
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
                        ),
                        Text(data['todoEnd']),
                        SizedBox(height: 20),
                      ],
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
