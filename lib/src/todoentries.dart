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
        .orderBy('todoStart', descending: true)
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
                        Text(
                          data['date'],
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data['todoStart'],
                          style: TextStyle(fontSize: 25),
                        ),
                        Card(
                          elevation: 5,
                          child: ListTile(
                            leading: const Icon(Icons.list),
                            tileColor: Colors.lightBlueAccent.shade100,
                            title: Text(
                              data['todoDescription'],
                              style: TextStyle(fontSize: 20),
                            ),
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
                                  TextButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection("todoLists")
                                          .doc(snapshot.data.toString())
                                          .delete();
                                      Navigator.pop(context, 'delete');
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          data['todoEnd'],
                          style: TextStyle(fontSize: 25),
                        ),
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
