import 'package:flores_tla/screens/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flores_tla/screens/Welcome_screen.dart';
import 'package:flores_tla/screens/create_task.dart';
import 'package:flores_tla/screens/settings.dart';


class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> tasks = [
    {'title': 'Meeting with Ms. Princess', 'date': '12 October 2024', 'completed': false},
  
  ];

  void _navigateToAddTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTaskScreen()),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
       // Navigate to WelcomeScreen when home icon is tapped
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
    } else if (index == 1) {
      // Navigate to Calendar screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalendarScreen(tasks: {},)),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _markTaskAsCompleted(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track your task!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nov, 2024',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF567DF4),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateChip('29', 'Fri', true),
                _buildDateChip('30', 'Sat', false),
                _buildDateChip('1', 'Sun', false),
                _buildDateChip('2', 'Mon', false),
                ElevatedButton.icon(
                  onPressed: _navigateToAddTask,
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    'Add Task',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF567DF4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return _buildTaskCard(task['title']!, task['date']!, index, newMethod(task)['completed']);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Map<String, dynamic> newMethod(Map<String, dynamic> task) => task;

  Widget _buildDateChip(String day, String weekDay, bool isSelected) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor:
              isSelected ? Color(0xFF567DF4) : Colors.grey[200],
          child: Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          weekDay,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskCard(String title, String date, int index, bool isCompleted) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: isCompleted ? Colors.green[100] : Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF567DF4),
          child: Icon(Icons.task, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text(date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.check_circle, 
                color: isCompleted ? Colors.green : const Color.fromARGB(255, 131, 223, 153),
              ),
              onPressed: () => _markTaskAsCompleted(index),
            ),
            IconButton(
              icon: Icon(
                Icons.cancel, 
                color: Colors.red,
              ),
              onPressed: () {
                _deleteTask(index); 
              },
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}