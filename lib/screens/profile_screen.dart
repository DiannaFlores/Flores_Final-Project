import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black, // Set title color to black
            ),
          ),
        ),
        backgroundColor: Colors.white, // Set AppBar background to white
        elevation: 0, // Remove shadow
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Icon at the top
            Center(
              child: CircleAvatar(
                radius: 50, // Set the radius of the profile icon
                backgroundColor: Colors.blue, // Background color of the circle
                child: Icon(
                  Icons.person,
                  size: 50, // Size of the icon
                  color: Colors.white, // Color of the icon
                ),
              ),
            ),
            SizedBox(height: 20), // Space between the icon and the fields

            // Name Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Change color when focused
                ),
              ),
            ),
            SizedBox(height: 16), // Space between fields

            // Phone Number Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Change color when focused
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16), // Space between fields

            // Email Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Change color when focused
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
