import 'package:flutter/foundation.dart';

//This allows the user to make an event for the calendar, so they can store the users mood.
class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}
