import 'package:flutter/material.dart';
import '/src/calendar.dart';
import '/src/todoentries.dart';
import '/src/diaryentries.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//This page makes the bottom navigation bar appear on every page.
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DiaryEntries(),
    TodoEntries(),
    Calendar()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.menu_book_rounded),
                label: 'Diary Entries',
                backgroundColor: Colors.lightBlueAccent.shade100),
            BottomNavigationBarItem(
                icon: const Icon(Icons.list_alt_rounded),
                label: 'To-do List',
                backgroundColor: Colors.lightBlueAccent.shade100),
            BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today_rounded),
                label: 'Calender',
                backgroundColor: Colors.lightBlueAccent.shade100),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
