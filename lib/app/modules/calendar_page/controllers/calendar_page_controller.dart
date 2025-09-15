import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarPageController extends GetxController {
var selectedMonth = 'April 2021'.obs;
  var selectedView = 'Month'.obs;
  
  final viewTypes = ['Date', 'Week', 'Month', 'Year'];
  final months = [
    'January 2021', 'February 2021', 'March 2021', 'April 2021',
    'May 2021', 'June 2021', 'July 2021', 'August 2021',
    'September 2021', 'October 2021', 'November 2021', 'December 2021'
  ];
  
  // Sample events data
  final events = {
    2: [
      {'name': 'Spicy Nugget', 'time': '3 more', 'color': Colors.red},
      {'name': 'Pizza la Piazza With Barbeque', 'time': '3 more', 'color': Colors.red},
    ],
    7: [
      {'name': 'Event', 'time': '', 'color': Colors.orange},
    ],
    9: [
      {'name': 'New Event', 'time': '08:04 - 10:23 AM', 'color': Colors.red},
    ],
    15: [
      {'name': 'Event', 'time': '', 'color': Colors.grey},
      {'name': 'Pass', 'time': '', 'color': Colors.grey},
    ],
    18: [
      {'name': 'Spicy Nugget', 'time': '3 more', 'color': Colors.teal},
      {'name': 'Pizza la Piazza With Barbeque', 'time': '3 more', 'color': Colors.teal},
    ],
    22: [
      {'name': 'Spicy Nugget', 'time': '3 more', 'color': Colors.blue},
      {'name': 'Pizza la Piazza With Barbeque', 'time': '3 more', 'color': Colors.blue},
    ],
    25: [
      {'name': 'New Event', 'time': '08:04 - 10:23 AM', 'color': Colors.teal},
    ],
  }.obs;
  
  // Get calendar days for April 2021
  List<int?> getCalendarDays() {
    // April 2021 starts on Thursday (day 4) and has 30 days
    List<int?> days = [];
    
    // Add previous month days (28, 29, 30, 31 from March)
    days.add(28);
    days.add(null); // Monday
    days.add(null); // Tuesday
    days.add(null); // Wednesday
    
    // Add current month days (1-30)
    for (int i = 1; i <= 30; i++) {
      days.add(i);
    }
    
    // Add next month days to complete the grid
    for (int i = 1; i <= 7; i++) {
      days.add(i);
    }
    
    return days;
  }
  
  bool isPreviousMonth(int index) {
    return index == 0; // Only day 28 is from previous month in our layout
  }
  
  bool isNextMonth(int index, int? day) {
    return index > 33; // Days after April 30th are from next month
  }
}
