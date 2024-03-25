import 'package:flutter/material.dart';
import 'package:malepa_redesign/services/AuthService.dart';

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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                print('Navigate to Home');
              },
            ),
            ListTile(
              title: const Text('Registration'),
              onTap: () {
                print('Navigate to Registration');
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
                  context), // Call _logout function with context when ListTile is tapped
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
                    // Navigate to Profile Settings screen
                    print('Navigate to Profile Settings');
                  },
                  icon: const Icon(Icons.account_circle),
                  iconSize: 40,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Navigate to Security Settings screen
                    print('Navigate to Security Settings');
                  },
                  icon: const Icon(Icons.security),
                  iconSize: 40,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Navigate to App Settings screen
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
                        // Add the contents of the selected series here
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

  final List<String> seriesOptions = [
    'JCE - February/2012',
    'JCE - November/2013',
    'JCE - November/2014',
    'JCE - November/2015',
    // Add more series options here...
  ];
}

void logout(BuildContext context) {
  // Implement logout logic here
  // For example, you can call AuthService.logout() if you have a logout method in your AuthService class
  //AuthService.logout(context);

  // Navigate back to the main.dart screen
  // Navigator.popUntil(context, ModalRoute.withName('/'));
  print('Logout triggered');
}

void main() {
  runApp(const MaterialApp(
    home: SupaNova(),
  ));
}
