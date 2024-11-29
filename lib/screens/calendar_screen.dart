import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  final Map<DateTime, List<String>> tasks; // Accept tasks from other screens

  CalendarScreen({required this.tasks});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<String>> _tasks;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _tasks = widget.tasks; // Initialize tasks with provided data
  }

  // Get tasks for a particular day
  List<String> _getTasksForDay(DateTime day) {
    return _tasks[day] ?? [];
  }

  // Helper to format date keys in _tasks map
  DateTime _getDateKey(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Task Calendar",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Calendar grid view
          _buildCalendar(),
          const SizedBox(height: 20),
          // Display tasks for the selected day
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tasks for ${_selectedDay.month}/${_selectedDay.day}/${_selectedDay.year}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView(
                      children: _getTasksForDay(_getDateKey(_selectedDay))
                          .map((task) => ListTile(
                                title: Text(task),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a calendar grid
  Widget _buildCalendar() {
    final lastDayOfMonth =
        DateTime(_selectedDay.year, _selectedDay.month + 1, 0);

    // Generate the days of the month
    List<Widget> calendarDays = [];
    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      final day = DateTime(_selectedDay.year, _selectedDay.month, i);
      final hasTasks = _tasks.containsKey(_getDateKey(day));

      calendarDays.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = day; // Set the tapped day as selected
            });
          },
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _selectedDay.day == i
                  ? Colors.blue
                  : hasTasks
                      ? Colors.green[200]
                      : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$i',
                style: TextStyle(
                  color: _selectedDay.day == i
                      ? Colors.white
                      : hasTasks
                          ? Colors.black
                          : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Create a grid layout for the calendar days
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      children: calendarDays,
    );
  }
}
