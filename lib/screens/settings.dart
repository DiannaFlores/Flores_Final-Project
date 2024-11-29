import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Import the ProfileScreen

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Setting
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigate to ProfileScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            Divider(),

            // Notifications Setting
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Switch(
                value: true,
                activeColor: Colors.blue,
                onChanged: (bool value) {},
              ),
            ),
            Divider(),

            // Dark Mode Setting
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Switch(
                value: false,
                activeColor: Colors.blue,
                onChanged: (bool value) {},
              ),
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
