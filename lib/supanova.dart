import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for kDebugMode
import 'package:malepa_redesign/services/AuthService.dart';
import 'package:malepa_redesign/users/standard/FreeTier.dart';
import 'package:malepa_redesign/services/RegForm.dart';

class SupaNova extends StatefulWidget {
  const SupaNova({super.key});

  @override
  _SupaNovaState createState() => _SupaNovaState();
}

class _SupaNovaState extends State<SupaNova> {
  final AuthService _authService =
      AuthService(); // Create an instance of AuthService

  String selectedSeries = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FreeTier()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Use a FutureBuilder to display the user's email/username or "Admin mode"
                  FutureBuilder<String>(
                    future: _authService
                        .currentUser(), // Your method to get the current user's info
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      // Determine the text to display
                      String displayText = kDebugMode
                          ? 'Admin mode'
                          : (snapshot.hasData ? snapshot.data! : 'Loading...');
                      return Text(
                        displayText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SupaNova()));
              },
            ),
            ListTile(
              title: const Text('Registration'),
              onTap: () {
                // Replace the current print statement with navigation code
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegForm()),
                );
              },
            ),
            ListTile(
              title: const Text('Exam Management'),
              onTap: () {
                print('Navigate to Pre-Exam');
              },
            ),
            ListTile(
              title: const Text('Result Management'),
              onTap: () {
                print('Navigate to Result Management');
              },
            ),
            ListTile(
              title: const Text('Reports'),
              onTap: () {
                print('Navigate to Reports');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout), // Icon for the logout button
              onTap: () => _authService.logout(
                  context), // Call logout function with context when ListTile is tapped
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FreeTier()),
                    );
                  },
                  icon: const Icon(Icons.account_circle),
                  iconSize: 40,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    print('Navigate to Security Settings');
                  },
                  icon: const Icon(Icons.security),
                  iconSize: 40,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    print('Navigate to App Settings');
                  },
                  icon: const Icon(Icons.settings),
                  iconSize: 40,
                ),
              ],
            ),
            const SizedBox(height: 20),
            selectedSeries.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Select a series:',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      for (var series in seriesOptions)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedSeries = series;
                            });
                          },
                          child: Text(series),
                        ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Series: $selectedSeries',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Contents of $selectedSeries...\n\n THIS IS A DEMO',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  List<String> seriesOptions = [
    'JCE - February/2012',
    'JCE - November/2013',
    'JCE - November/2014',
    'JCE - November/2015',
  ]; // Example series options
}
