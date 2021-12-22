import 'package:flutter/material.dart';
import 'package:individualproject/model/event.dart';
import 'package:table_calendar/table_calendar.dart';

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
  moods? _mood = moods.meh;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: const Text("Calendar"),
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
            title: const Text("mood for the day"),
            actions: <Widget>[
              RadioListTile<moods>(
                title: const Text('Very Happy'),
                value: moods.veryHappy,
                groupValue: _mood,
                onChanged: (moods? value) {
                  setState(() {
                    _mood = value;
                  });
                },
              ),
              RadioListTile<moods>(
                title: const Text('Happy'),
                value: moods.happy,
                groupValue: _mood,
                onChanged: (moods? value) {
                  setState(() {
                    _mood = value;
                  });
                },
              ),
              RadioListTile<moods>(
                title: const Text('Meh'),
                value: moods.meh,
                groupValue: _mood,
                onChanged: (moods? value) {
                  setState(() {
                    _mood = value;
                  });
                },
              ),
              RadioListTile<moods>(
                title: const Text('Sad'),
                value: moods.sad,
                groupValue: _mood,
                onChanged: (moods? value) {
                  setState(() {
                    _mood = value;
                  });
                },
              ),
              RadioListTile<moods>(
                title: const Text('Very Sad'),
                value: moods.verySad,
                groupValue: _mood,
                onChanged: (moods? value) {
                  setState(() {
                    _mood = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (selectedEvents[selectedDay] != null) {
                        selectedEvents[selectedDay]!.add(
                          Event(
                            title: _mood.toString(),
                          ),
                        );
                      } else {
                        selectedEvents[selectedDay] = [
                          Event(
                            title: _mood.toString(),
                          ),
                        ];
                      }
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
        label: const Text("how was your mood for the day?"),
        icon: const Icon(Icons.app_registration),
      ),
    );
  }
}
