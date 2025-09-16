import 'package:admin_dashboard/app/modules/home_landing/views/home_landing_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calendar_page_controller.dart';

class CalendarPageView extends GetView<CalendarPageController> {
  const CalendarPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          buildTopBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  // Header
                  _buildHeader(),
                  SizedBox(height: 32),

                  // Calendar
                  Expanded(child: _buildCalendar()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Month/Year Selector
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Text(
                  controller.selectedMonth.value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
              ],
            ),
          ),
        ),

        Spacer(),

        // View Type Selector
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: controller.viewTypes.map((type) {
              bool isSelected = controller.selectedView.value == type;
              return GestureDetector(
                onTap: () => controller.selectedView.value = type,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.teal : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[600],
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        SizedBox(width: 16),

        // Today Button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Today (25)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ),

        SizedBox(width: 16),

        // New Schedule Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'New Schedule',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Days of week header
          _buildDaysHeader(),

          // Calendar grid
          Expanded(child: _buildCalendarGrid()),
        ],
      ),
    );
  }

  Widget _buildDaysHeader() {
    final daysOfWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: daysOfWeek.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final days = controller.getCalendarDays();

    return GridView.builder(
      padding: EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        if (day == null) return SizedBox();

        bool isPrevious = controller.isPreviousMonth(index);
        bool isNext = controller.isNextMonth(index, day);
        bool hasEvents =
            controller.events.containsKey(day) && !isPrevious && !isNext;

        return _buildCalendarCell(day, isPrevious, isNext, hasEvents);
      },
    );
  }

  Widget _buildCalendarCell(
    int day,
    bool isPrevious,
    bool isNext,
    bool hasEvents,
  ) {
    Color textColor = isPrevious || isNext ? Colors.grey[400]! : Colors.black87;
    Color? backgroundColor;

    // Set background colors for specific days with events
    if (hasEvents) {
      final dayEvents = controller.events[day]!;
      if (day == 2) {
        backgroundColor = Colors.red[50];
      } else if (day == 18) {
        backgroundColor = Colors.teal[50];
      } else if (day == 22) {
        backgroundColor = Colors.blue[50];
      }
    }

    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey[100]!, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day number
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              day.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),

          // Events
          if (hasEvents) ..._buildEventItems(day),
        ],
      ),
    );
  }

  List<Widget> _buildEventItems(int day) {
    final dayEvents = controller.events[day]!;
    List<Widget> eventWidgets = [];

    for (var event in dayEvents.take(2)) {
      // Show max 2 events per day
      eventWidgets.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: event['color'] as Color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event['name'].toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (event['time'].toString().isNotEmpty)
                Text(
                  event['time'].toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 8,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return eventWidgets;
  }
}
