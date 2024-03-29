import 'package:flutter/material.dart';

class FreeTier extends StatelessWidget {
  const FreeTier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Tier Account Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your account management widgets here
            const Text(
              'Welcome to the Free Tier Account Manager!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic for managing free tier accounts
                print('Manage Accounts');
              },
              child: const Text('Manage Accounts'),
            ),
          ],
        ),
      ),
    );
  }
}
