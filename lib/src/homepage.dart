import 'package:flutter/material.dart';
import '/src/calender.dart';
import '/src/todoentries.dart';
import '/src/diaryentries.dart';
import '/src/aboutyou.dart';

class HomePage extends StatefulWidget {
  final FocusNode focusNode;

  const HomePage({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AboutYou(),
    DiaryEntries(),
    TodoEntries(),
    Calender()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // AboutYou(),
  // WriteADiaryRoute(),
  // WriteATodo(),
  // Calender()
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.lightBlueAccent.shade100),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded),
                label: 'Diary Entries',
                backgroundColor: Colors.lightBlueAccent.shade100),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: 'To-do List',
                backgroundColor: Colors.lightBlueAccent.shade100),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: 'To-do List',
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
