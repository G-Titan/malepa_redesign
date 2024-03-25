import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'services/AuthService.dart';
import 'supanova.dart';

void main() {
  runApp(const MalepaApp());
}

class MalepaApp extends StatelessWidget {
  const MalepaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malepa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MalepaHomePage(),
    );
  }
}

class MalepaHomePage extends StatelessWidget {
  const MalepaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the app is running in debug mode
    bool debugMode = !kReleaseMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Malepa',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Botswana National Examination Processing System',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/malepa_logo.png',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: const Text(
                  "Botswana Examinations Council (BEC) is mandated under Section 5 of the Botswana Examinations Council Act No. 11 of 2002, 'to conduct schools examinations and any other examinations for the Ministry and issue certificates in respect of such examinations.' BEC's key business activity is the development, administration, accreditation and certification of schools examinations in the primary and secondary education sub-sector.\n\n"
                  "Vision\nTo be a provider of accessible and globally competitive qualification.\n\n"
                  "Mission\nTo provide effective and responsive quality centred assessment and examination system.",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ElevatedButton(
                onPressed: () {
                  // Check if the app is running in debug mode
                  if (debugMode) {
                    // If in debug mode, navigate directly to SupaNova screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SupaNova()),
                    );
                  } else {
                    // If not in debug mode, show login dialog
                    AuthService().initializeFirebaseAndShowLogin(context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: const Text(
                    'Begin',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
