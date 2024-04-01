import 'package:flutter/material.dart';

class DataPreviewScreen extends StatefulWidget {
  final String name;
  final String email;

  DataPreviewScreen({required this.name, required this.email});
  @override
  _DataPreviewScreenState createState() => _DataPreviewScreenState();
}

class _DataPreviewScreenState extends State<DataPreviewScreen> {
  List<Map<String, String>> entries = [];

  @override
  void initState() {
    super.initState();
    // Automatically add the initial entry when the screen is first loaded
    _addEntry(widget.name, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview your data:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildDataTable(), // Display the data table
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _addEntry(widget.name, widget.email);
                  },
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Edit button logic
                    print('Edit button pressed');
                  },
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Email')),
      ],
      rows: entries.map<DataRow>((entry) {
        return DataRow(cells: [
          DataCell(Text(entry['name'] ?? '')),
          DataCell(Text(entry['email'] ?? '')),
        ]);
      }).toList(),
    );
  }

  void _addEntry(String name, String email) {
    // Create a new entry with the provided name and email
    Map<String, String> newEntry = {'name': name, 'email': email};

    // Add the new entry to the list of entries
    entries.add(newEntry);

    // Update the UI
    setState(() {});
  }
}
