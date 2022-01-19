import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:individualproject/model/event.dart';
import 'package:individualproject/src/settingspage.dart';
import 'package:table_calendar/table_calendar.dart';

import 'gpnearme.dart';
import 'helplinespage.dart';

//This is the dart class that makes the calender, so the user can view it and write they're mood.
//Here we are using the dependency called table calender, to implement the calender.
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

enum moods { veryHappy, happy, meh, sad, verySad }

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController _moodController = TextEditingController();
  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _moodStream = FirebaseFirestore.instance
        .collection('moodCalendar')
        .where('mood', isEqualTo: user!.uid)
        .snapshots(includeMetadataChanges: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: const Text(
          "Calendar",
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
                  MaterialPageRoute(builder: (context) => const GPNearMePage()),
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
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: selectedDay,
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                eventLoader: _getEventsFromDay,
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
              ),
              ..._getEventsFromDay(selectedDay).map(
                (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // title: const Text("mood for the day"),
            content: TextFormField(
              controller: _moodController,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () async {
                      final String mood = _moodController.text.trim();
                      if (_moodController.text.isEmpty) {
                      } else {
                        if (selectedEvents[selectedDay] != null) {
                          selectedEvents[selectedDay]!.add(
                            Event(title: _moodController.text),
                          );
                        } else {
                          selectedEvents[selectedDay] = [
                            Event(title: _moodController.text)
                          ];
                        }
                      }

                      User? user = FirebaseAuth.instance.currentUser;

                      await FirebaseFirestore.instance
                          .collection("moodCalendar")
                          .add({
                        'uid': user!.uid,
                        'mood': mood,
                      });

                      Navigator.pop(context);
                      setState(() {});
                      return;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        label: const Text(
          "how was your mood for the day?",
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.app_registration,
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
