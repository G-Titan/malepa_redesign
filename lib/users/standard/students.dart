import 'package:flutter/material.dart';

class LocalStudentInfoScreen extends StatelessWidget {
  const LocalStudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Student Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add fields to collect local student information here
            const TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            // Add more fields as needed for local student information
            ElevatedButton(
              onPressed: () {
                // Implement logic to save local student information
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForeignStudentInfoScreen extends StatelessWidget {
  const ForeignStudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foreign Student Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add fields to collect foreign student information here
            const TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            // Add more fields as needed for foreign student information
            ElevatedButton(
              onPressed: () {
                // Implement logic to save foreign student information
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
