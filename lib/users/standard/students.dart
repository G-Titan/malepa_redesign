import 'package:flutter/material.dart';

class LocalStudentInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Student Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add fields to collect local student information here
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            // Add more fields as needed for local student information
            ElevatedButton(
              onPressed: () {
                // Implement logic to save local student information
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForeignStudentInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foreign Student Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add fields to collect foreign student information here
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            // Add more fields as needed for foreign student information
            ElevatedButton(
              onPressed: () {
                // Implement logic to save foreign student information
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
